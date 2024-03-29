# Generated by Django 3.1.2 on 2020-10-26 16:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopit', '0014_auto_20201026_2023'),
    ]

    operations = [
        migrations.AlterField(
            model_name='brand',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='category',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='filtercategory',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='filterproperties',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='filterproperties',
            name='value',
            field=models.ManyToManyField(blank=True, to='shopit.FilterValues'),
        ),
        migrations.AlterField(
            model_name='filtervalues',
            name='value',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='pricefiltercategory',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='subcategory',
            name='name',
            field=models.CharField(max_length=100),
        ),
    ]
