# Generated by Django 3.1.2 on 2020-10-21 15:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_add_password_reset_model'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailconfirmation',
            name='token',
            field=models.CharField(default='G0TcsolYG5RxKz-mEjb-b4Q_GzIN0-sPtJyJv6s7uhQ', max_length=20),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='success_token',
            field=models.CharField(blank=True, max_length=250, null=True),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='url_token',
            field=models.CharField(default='D5D5tB48q5j94ePcx3mJSjGEtth5VwUfit6sAvavPHk', max_length=250),
        ),
    ]
