# Generated by Django 3.1.2 on 2020-10-28 11:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shopit', '0022_auto_20201028_1625'),
    ]

    operations = [
        migrations.AddField(
            model_name='availablefilterselectoptions',
            name='value',
            field=models.CharField(max_length=100, null=True),
        ),
    ]