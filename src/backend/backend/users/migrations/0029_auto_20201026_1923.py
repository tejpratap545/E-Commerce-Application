# Generated by Django 3.1.2 on 2020-10-26 13:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0028_auto_20201026_1916'),
    ]

    operations = [
        migrations.AlterField(
            model_name='emailconfirmation',
            name='token',
            field=models.CharField(default='AZ8CDDXNYixsr-ioBAUtcHd7cN8kqbc0jWqiMahwOJA', editable=False, max_length=250),
        ),
        migrations.AlterField(
            model_name='passwordreset',
            name='url_token',
            field=models.CharField(default='b_s9F4wGu-UW2awpYiqcQjQKhoefdq56AZrOQOOfub4', editable=False, max_length=250),
        ),
    ]