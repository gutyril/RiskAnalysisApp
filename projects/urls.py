from django.conf.urls import patterns, url
from django.views.generic import DetailView, ListView
from projects.models import Proyecto

urlpatterns = patterns('',
    url(r'^$',
        ListView.as_view(
            queryset=Proyecto.objects.order_by('-fecha_de_inicio'),
            context_object_name='lista_de_proyectos',
            template_name='projects/index.html'),
        name='index'),
    url(r'^(?P<pk>\d+)/$',
        DetailView.as_view(
            model=Proyecto,
            template_name='projects/detail.html'),
        name='detalle_proyecto'),
    url(r'^(?P<proyecto_id>\d+)/(?P<categoria_id>\d+)/$',
        'projects.views.listar_riesgos',
        name='lista_riesgos'),
    url(r'^(?P<proyecto_id>\d+)/(?P<categoria_id>\d+)/evaluar/$',
        'projects.views.evaluar_riesgos',
        name='evaluar'),
)
