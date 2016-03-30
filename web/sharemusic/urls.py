from django.conf.urls import include, url
from django.contrib import admin

from sharemusic.apps.core.models import User
from sharemusic.apps.storage.models import Directory

if len(Directory.objects.all())== 0:
    base_dir = Directory(path='/usr/src/app/music')
    base_dir.save(is_basedir=True)
    user = User.objects.create_superuser(username='admin', email='Admin@admin.com', password='admin')

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/v1/', include('sharemusic.apps.api.v1.urls', namespace='api')),
    url(r'^', include('sharemusic.apps.client.urls')),
]

