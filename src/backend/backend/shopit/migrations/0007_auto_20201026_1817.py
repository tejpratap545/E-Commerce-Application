# Generated by Django 3.1.2 on 2020-10-26 12:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopit', '0006_auto_20201026_1814'),
    ]

    operations = [
        migrations.AlterField(
            model_name='filterproperties',
            name='value',
            field=models.ManyToManyField(to='shopit.FilterValues'),
        ),
    ]
