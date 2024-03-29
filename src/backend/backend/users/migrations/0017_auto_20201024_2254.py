# Generated by Django 3.1.2 on 2020-10-24 17:24

from django.conf import settings
import django.contrib.postgres.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0016_auto_20201024_2231'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailconfirmation',
            name='token',
            field=models.CharField(default='92TmChvn767H1DvikX7-XzlQ5AndQ2XfvvloF5A6V84', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='url_token',
            field=models.CharField(default='m_S_QwrzKm2_7xlsbZVkx1xfetxxinMSCRO-MpifAHc', editable=False, max_length=250),
        ),
        migrations.CreateModel(
            name='Seller',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=120)),
                ('tags', django.contrib.postgres.fields.ArrayField(base_field=models.TextField(), size=None)),
                ('billing_address', models.ManyToManyField(to='users.BillingAddress')),
                ('seller_address', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='users.shippingaddress')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
