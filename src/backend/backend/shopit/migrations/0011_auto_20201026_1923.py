# Generated by Django 3.1.2 on 2020-10-26 13:53

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('shopit', '0010_auto_20201026_1916'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='brand',
            field=models.ManyToManyField(blank=True, related_name='brand', related_query_name='brand', to='shopit.Brand'),
        ),
        migrations.AlterField(
            model_name='filtercategory',
            name='properties',
            field=models.ManyToManyField(blank=True, to='shopit.FilterProperties'),
        ),
        migrations.AlterField(
            model_name='filterproperties',
            name='value',
            field=models.ManyToManyField(blank=True, to='shopit.FilterValues'),
        ),
        migrations.AlterField(
            model_name='productfaq',
            name='answer',
            field=models.ManyToManyField(blank=True, to='shopit.ProductFAQAnswer'),
        ),
        migrations.AlterField(
            model_name='productreview',
            name='comments',
            field=models.ManyToManyField(blank=True, to='shopit.CommentOnReview'),
        ),
        migrations.AlterField(
            model_name='productreview',
            name='report',
            field=models.ManyToManyField(blank=True, to='shopit.Report'),
        ),
        migrations.AlterField(
            model_name='productreview',
            name='user',
            field=models.ManyToManyField(blank=True, to=settings.AUTH_USER_MODEL),
        ),
    ]
