from django.contrib.auth.mixins import AccessMixin
from django.contrib.auth.views import redirect_to_login
from django.urls import reverse_lazy

class LoginRequiredMixin(AccessMixin):
    """
    Mixin to require that the user is logged in.
    If the user is not logged in, redirect to the login page.
    """
    login_url = reverse_lazy('acocunts:login')  # Replace 'your_login_url_name' with the name of your login URL

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return self.handle_no_permission()
        return super().dispatch(request, *args, **kwargs)

    def handle_no_permission(self):
        return redirect_to_login(self.request.get_full_path(), self.get_login_url(), self.get_redirect_field_name())