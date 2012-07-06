# -*- coding: iso-8859-15 -*-
from django.db import models


# Project type catalog
class Tipo_de_Proyecto(models.Model):
    nombre = models.CharField(max_length=100)

    def __unicode__(self):
        return self.nombre


# Project Class
class Proyecto(models.Model):
    nombre = models.CharField(max_length=200)
    descripcion = models.CharField(max_length=500)
    fecha_de_inicio = models.DateTimeField('Fecha de inicio')
    fecha_de_termino = models.DateTimeField('Fecha de terminacion')

    def calcula_puntaje_total(self):
        riesgo_list = Riesgo.objects.filter(proyecto__exact=self.id)
        total = 0
        for riesgo in riesgo_list:
            total = total + (riesgo.impacto * riesgo.probabilidad * riesgo.tipo_de_riesgo.factor)
        return int((total / 384) * 100)

    def __unicode__(self):
        return self.nombre


# Members
class Intengrante(models.Model):
    POSITION = (
        (1, 'Desarrollador de Software'),
        (2, 'Aseguramiento de Calidad'),
        (3, 'Administrador de Sistemas'),
    )
    nombre = models.CharField(max_length=150)
    puesto = models.CharField(max_length=30, choices=POSITION)
    proyecto = models.ForeignKey(Proyecto)

    def __unicode__(self):
        return self.nombre


# Override from Integer Field to support min and max vaue
class FloatRangeField(models.FloatField):
    def __init__(self, verbose_name=None, name=None, min_value=None, max_value=None, **kwargs):
        self.min_value, self.max_value = min_value, max_value
        models.FloatField.__init__(self, verbose_name, name, **kwargs)

    def formfield(self, **kwargs):
        defaults = {'min_value': self.min_value, 'max_value': self.max_value}
        defaults.update(kwargs)
        return super(FloatRangeField, self).formfield(**defaults)


#Categoria de riesgo
class Categoria_de_riesgo(models.Model):
    nombre = models.CharField(max_length=100)

    def __unicode__(self):
        return self.nombre


#Risk types
class Tipo_de_riesgo(models.Model):
    nombre = models.CharField(max_length=100)
    factor = FloatRangeField(max_length=1, min_value=0, default=1)
    categoria_de_riesgo = models.ForeignKey(Categoria_de_riesgo)

    def __unicode__(self):
        return self.nombre


# Override from Integer Field to support min and max vaue
class IntegerRangeField(models.IntegerField):
    def __init__(self, verbose_name=None, name=None, min_value=None, max_value=None, **kwargs):
        self.min_value, self.max_value = min_value, max_value
        models.IntegerField.__init__(self, verbose_name, name, **kwargs)

    def formfield(self, **kwargs):
        defaults = {'min_value': self.min_value, 'max_value': self.max_value}
        defaults.update(kwargs)
        return super(IntegerRangeField, self).formfield(**defaults)


#Risk
class Riesgo(models.Model):
    proyecto = models.ForeignKey(Proyecto)
    tipo_de_riesgo = models.ForeignKey(Tipo_de_riesgo)
    impacto = IntegerRangeField(default=0, min_value=0, max_value=4)
    probabilidad = IntegerRangeField(default=0, min_value=0, max_value=4)

    class Meta:
        unique_together = ("proyecto", "tipo_de_riesgo")

    def __unicode__(self):
        return self.tipo_de_riesgo.nombre
