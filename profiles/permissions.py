


from rest_framework.permissions import BasePermission


class IsProfileOwnerOrReadOnly(BasePermission):
    message = "You can only modify your own profile."

    def has_object_permission(
        self,
        request,
        view,
        obj
    ):
        if request.method in ["GET", "HEAD", "OPTIONS"]:
            return True

        return obj.user == request.user