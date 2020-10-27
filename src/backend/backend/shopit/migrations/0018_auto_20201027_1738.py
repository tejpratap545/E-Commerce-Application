# Generated by Django 3.1.2 on 2020-10-27 12:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopit', '0017_auto_20201027_0137'),
    ]

    operations = [
        migrations.RenameField(
            model_name='filterproperties',
            old_name='value',
            new_name='values',
        ),
        migrations.AddField(
            model_name='filterproperties',
            name='property_type',
            field=models.CharField(choices=[('S', 'SELECT'), ('T', 'TEXT')], default='S', max_length=1),
        ),
        migrations.AddField(
            model_name='filtervalues',
            name='name',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='category',
            name='brand',
            field=models.ManyToManyField(blank=True, to='shopit.Brand'),
        ),
        migrations.AlterField(
            model_name='filterproperties',
            name='values',
            field=models.ManyToManyField(blank=True, to='shopit.FilterValues'),
        ),
        migrations.AlterField(
            model_name='filtervalues',
            name='value',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
