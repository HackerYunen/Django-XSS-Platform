from . import settings
from .views import *
from django.views import static
from django.contrib import admin
from django.urls import include, re_path


urlpatterns = [
    re_path(r'^$',show_index),
    re_path(r'^js',show_pyload),
    re_path(r'^rev',rev_value),
    re_path(r'^user/',include('xssuser.urls')),
    re_path(r'^admin/', admin.site.urls),
    re_path(r'^static/(?P<path>.*)$', static.serve, {'document_root': settings.STATIC_ROOT}, name='static'),
]
