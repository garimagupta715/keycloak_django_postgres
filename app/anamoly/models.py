import logging
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.contrib.postgres.fields import ArrayField
from pip._internal import self_outdated_check
# from enums import EnumField, USER_TYPE_ENUM, USER_TYPES_VALUES, APPLICATION_TYPE_ENUM

logger = logging.getLogger(__name__)

# USER_TYPES = set(USER_TYPES_VALUES) | {x for x in USER_TYPE_ENUM}


class UserManager(BaseUserManager):
    
    def create_user(self, email, password=None, **extra_fields):
        """create and save user"""
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password):
        """create superuser"""
        user = self.create_user(email, password)
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user
        

class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=225)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    
    objects = UserManager()
    USERNAME_FIELD = 'email'
#     def get_by_natural_key(self, auth_id):
#         return self.get(auth_id=auth_id)
# 
#     @staticmethod
#     def _modify_user_defaults(defaults):
#         mapped = {
#             'given_name': 'first_name',
#             'family_name': 'last_name',
#             'email': 'email_address',
#         }
# 
#         attrs = {'auth_id', 'job_title', 'sector', 'user_type'} | set(mapped.values())
#         unmapped = {k: defaults[k] for k in attrs if k in defaults}
#         mapped = {renamed: defaults[key] for key, renamed in mapped.items() if key in defaults}
#         # mapped override provided defaults
#         ret = {**unmapped, **mapped}
#         if 'user_type' in ret and ret.get('user_type') not in USER_TYPES:
#             invalid_user_type = ret.pop('user_type')
#             ret['user_type'] = None
#             logger.error(
#                 'Invalid user type %s set on %s',
#                 invalid_user_type,
#                 ret.get('auth_id', 'UNKNOWN USER'),
#             )
#         return ret
# 
#     def get_or_create(self, **kwargs):
#         defaults = kwargs.pop('defaults', dict())
#         defaults = self._modify_user_defaults(defaults)
#         return super().get_or_create(**kwargs, defaults=defaults)
# 
#     def update_or_create(self, **kwargs):
#         defaults = kwargs.pop('defaults', dict())
#         defaults = self._modify_user_defaults(defaults)
#         return super().update_or_create(**kwargs, defaults=defaults)

#
# @brief      Class implementing Django's django.contrib.auth.PermissionMixin so that
#             we can use the Django admin with our user class
#
# class KeycloakUser(object):

#     @property
#     def is_superuser(self):
#         return self.user_type is USER_TYPE_ENUM.SUPERUSER
# 
#     @property
#     def is_onai(self):
#         return self.user_type in {USER_TYPE_ENUM.SUPERUSER, USER_TYPE_ENUM.ANALYST}
# 
#     def get_group_permissions(self, obj=None):
#         pass
# 
#     def get_all_permissions(self, obj=None):
#         pass
# 
#     def has_perm(self, perm, obj=None):
#         return True
# 
#     def has_perms(self, perm_list, obj=None):
#         return True
# 
#     def has_module_perms(self, package_name):
#         return package_name == 'anamoly'
# 
# 
# class User(AbstractBaseUser, KeycloakUser):
# 
#     class Meta:
#         db_table = 'user'
# 
#     objects = UserManager()
# 
#     user_id = models.AutoField(primary_key=True)
# 
#     auth_id = models.TextField(unique=True, null=False)
#     first_name = models.TextField(help_text="First Name", null=True)
#     middle_name = models.TextField(null=True)
#     last_name = models.TextField(help_text="Last Name", null=True)
#     email_address = models.TextField(null=True)
#     job_title = models.TextField(null=True)
#     total_no_loans = models.IntegerField(null=True)
#     open_loans = models.IntegerField(null=True)
#     requires_action = models.IntegerField(null=True)
# 
#     user_type = EnumField(USER_TYPE_ENUM, null=True)
#     access_groups = models.ManyToManyField('AccessGroup', related_name='users')
#     enabled_features = ArrayField(models.TextField(), default=list)
#     disabled_features = ArrayField(models.TextField(), default=list)
#     capabilities = ArrayField(models.TextField(), default=list)
# 
#     def __repr__(self):
#         return f'user_id {self.user_id}'
# 
#     USERNAME_FIELD = 'auth_id'
#     EMAIL_FIELD = 'email_address'
#     REQUIRED_FIELDS = ['first_name', 'email_address', 'last_name']
# 
#     @property
#     def username(self):
#         return f'{self.first_name} {self.last_name}'
# 
# 
# class UserApplicationVisit(models.Model):
# 
#     class Meta:
#         db_table = 'user_application_visit'
# 
#     user = models.ForeignKey(
#         'User', on_delete=models.PROTECT, null=False, related_name='application_visits'
#     )
#     created_at = models.DateTimeField(auto_now_add=True)
#     application_visited = EnumField(APPLICATION_TYPE_ENUM, null=True)
# 
#     def save(self, *args, **kwargs):
#         # We do not want to allow altering the user vists history
#         if self.pk:
#             raise Exception('UserApplicationVisit cannot be altered.')
#         return super().save(*args, **kwargs)
