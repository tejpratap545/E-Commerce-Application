# Generated by Django 3.1.2 on 2020-10-28 20:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shopit', '0025_auto_20201028_2024'),
    ]

    operations = [
        migrations.RenameField(
            model_name='productreview',
            old_name='user',
            new_name='created_by',
        ),
    ]