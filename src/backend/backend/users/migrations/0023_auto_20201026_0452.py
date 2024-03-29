# Generated by Django 3.1.2 on 2020-10-25 23:22

from django.db import migrations, models
import django_better_admin_arrayfield.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0022_auto_20201025_2115'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailconfirmation',
            name='token',
            field=models.CharField(default='zbt0kD98f4FiFjno09gCNzEDwzNOPpnovSKZV2mCqxY', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='url_token',
            field=models.CharField(default='e_jSaAPiUWdqhpYQsH9a_UR7gwaev02gesf_ibfelbc', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='seller',
            name='tags',
            field=django_better_admin_arrayfield.models.fields.ArrayField(base_field=models.TextField(), null=True, size=None),
        ),
    ]
