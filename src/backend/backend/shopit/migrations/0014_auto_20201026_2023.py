# Generated by Django 3.1.2 on 2020-10-26 14:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopit', '0013_auto_20201026_1948'),
    ]

    operations = [
        migrations.AlterField(
            model_name='filterproperties',
            name='value',
            field=models.ManyToManyField(blank=True, to='shopit.FilterValues'),
        ),
    ]
