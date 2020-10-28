# Generated by Django 3.1.2 on 2020-10-25 15:45

from django.db import migrations, models
import django_better_admin_arrayfield.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('shopit', '0003_auto_20201025_2050'),
    ]

    operations = [
        migrations.AlterField(
            model_name='brand',
            name='tags',
            field=django_better_admin_arrayfield.models.fields.ArrayField(base_field=models.TextField(), size=None),
        ),
        migrations.AlterField(
            model_name='category',
            name='tags',
            field=django_better_admin_arrayfield.models.fields.ArrayField(base_field=models.TextField(), size=None),
        ),
        migrations.AlterField(
            model_name='filterproperties',
            name='value',
            field=models.ManyToManyField(to='shopit.FilterValues'),
        ),
        migrations.AlterField(
            model_name='product',
            name='media',
            field=django_better_admin_arrayfield.models.fields.ArrayField(base_field=models.URLField(), null=True, size=None),
        ),
        migrations.AlterField(
            model_name='productinfo',
            name='tags',
            field=django_better_admin_arrayfield.models.fields.ArrayField(base_field=models.TextField(), size=None),
        ),
    ]