import django_filters
from django import forms
from django.utils.translation import gettext_lazy as _
from tasks.models import Task
from statuses.models import Status
from users.models import User
from labels.models import Label


class TaskFilter(django_filters.FilterSet):
    status = django_filters.ModelChoiceFilter(
        queryset=Status.objects.all(),
        label=_('Статус'),
    )
    executor = django_filters.ModelChoiceFilter(
        queryset=User.objects.all(),
        label=_('Исполнитель'),
    )
    labels = django_filters.ModelChoiceFilter(
        queryset=Label.objects.all(),
        label=_('Метка'),
        field_name='labels',
    )
    self_tasks = django_filters.BooleanFilter(
        method='filter_self_tasks',
        label=_('Только свои задачи'),
        widget=forms.CheckboxInput,
    )

    class Meta:
        model = Task
        fields = ['status', 'executor', 'labels']

    def filter_self_tasks(self, queryset, name, value):
        if value:
            return queryset.filter(author=self.request.user)
        return queryset