# Generated by Django 3.1.2 on 2020-10-26 14:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0029_auto_20201026_1923'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailconfirmation',
            name='token',
            field=models.CharField(default='-0xt54Uyykz9iHhSFKWr2oyyJ208CizylucySBTcGfs', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='url_token',
            field=models.CharField(default='UsQ0cnpaNFvzx4tnZEGQtfARBsCnIR7B_TQk9jFaK-c', editable=False, max_length=250),
        ),
    ]
