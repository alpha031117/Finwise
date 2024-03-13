from django.contrib.auth.forms import AuthenticationForm
from crispy_forms.helper import FormHelper
from django import forms

class CustomAuthenticationForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.helper = FormHelper()
        self.helper.form_tag = False