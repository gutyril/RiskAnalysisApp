# -*- coding: iso-8859-15 -*-
from django.shortcuts import render_to_response, get_object_or_404
from projects.models import Proyecto, Categoria_de_riesgo, Riesgo, Tipo_de_riesgo
from django.http import  HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.template import RequestContext


# Método que muestra la pantalla con la lista de riesgos de un proyecto de una categoría de riesgo dada
def listar_riesgos(request, proyecto_id, categoria_id):
        proyecto = get_object_or_404(Proyecto, pk=proyecto_id)
        riesgo_list = Riesgo.objects.filter(proyecto__exact=proyecto.id)
        if riesgo_list.count() == 0:
            for tipo_de_riesgo in Tipo_de_riesgo.objects.all():
                riesgo = Riesgo(proyecto=proyecto, tipo_de_riesgo=tipo_de_riesgo)
                riesgo.save()

        categoria = get_object_or_404(Categoria_de_riesgo, pk=categoria_id)
        riesgo_list = []
        for tipo_de_riesgo in Tipo_de_riesgo.objects.filter(categoria_de_riesgo__exact=categoria.id):
            riesgo_list.append(Riesgo.objects.get(proyecto__exact=proyecto_id, tipo_de_riesgo_id__exact=tipo_de_riesgo.id))
        return render_to_response('projects/riesgos.html', {'riesgo_list': riesgo_list, 'categoria': categoria}, context_instance=RequestContext(request))


# Método que realiza la evaluación de riesgos de un proyecto correspondientes a una categoría de riesgo
# Cuando todos los riesgos del proyecto ya han sido evaluados direcciona a la página principal
def evaluar_riesgos(request, proyecto_id, categoria_id):
        categoria = get_object_or_404(Categoria_de_riesgo, pk=categoria_id)
        riesgo_list = []
        for tipo_de_riesgo in Tipo_de_riesgo.objects.filter(categoria_de_riesgo__exact=categoria.id):
            riesgo_list.append(Riesgo.objects.get(proyecto__exact=proyecto_id, tipo_de_riesgo_id__exact=tipo_de_riesgo.id))

        for riesgo in riesgo_list:
            # TODO: Validar que olos datos que se reciben sean del formato correcto.
            riesgo.impacto = request.POST['impacto_' + str(riesgo.id)]
            riesgo.probabilidad = request.POST['probabilidad_' + str(riesgo.id)]
            riesgo.save()

        # Si estamos evaluando la última categoría direccionamos a index para mostrar el resultado
        siguiente_categoria = int(categoria_id) + 1
        try:
            Categoria_de_riesgo.objects.get(pk=siguiente_categoria)
        except Categoria_de_riesgo.DoesNotExist:
            return HttpResponseRedirect(reverse('index'))
        else:
            return HttpResponseRedirect(reverse('lista_riesgos', args=(proyecto_id, siguiente_categoria,)))
