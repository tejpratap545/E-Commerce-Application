# Generated by Django 3.1.2 on 2020-10-25 15:45

from django.db import migrations, models
import django_better_admin_arrayfield.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0021_auto_20201025_2050'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailconfirmation',
            name='token',
            field=models.CharField(default='JDjxZkrGjFNesYjvFzFeaBlbLkN_EsYqYKrel_gVRJY', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='url_token',
            field=models.CharField(default='ZFVgCNHQAqpzXp3fnIwTcWmCWp8XEdbP1eTKQit7nCY', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='seller',
            name='tags',
            field=django_better_admin_arrayfield.models.fields.ArrayField(base_field=models.TextField(), size=None),
        ),
    ]