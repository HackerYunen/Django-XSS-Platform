from .views import *
from django.urls import re_path

urlpatterns = [
    re_path(r'^$',show_index),
    re_path(r'^login\/+$',user_login),
    re_path(r'^register\/+$',user_register),
    re_path(r'^logout\/+$',user_logout),
    re_path(r'^changepass\/+$', user_changepass),
    re_path(r'^project\/+$',show_project),
    re_path(r'^projectinfo\/+$',show_letter),
    re_path(r'^addproject\/+$',show_addproject),
    re_path(r'^ajax_del_letter\/+$', ajax_delete_letter),
    re_path(r'^ajax_add_project\/+$', ajax_add_project),
    re_path(r'^ajax_del_project\/+$',ajax_delete_project),
    re_path(r'^ajax_letter_value\/+$', ajax_letter_value),
    re_path(r'^ajax_payload_explain\/+$',ajax_payload_explain)
]