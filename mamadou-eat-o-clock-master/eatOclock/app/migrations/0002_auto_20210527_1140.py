# Generated by Django 3.2.3 on 2021-05-27 09:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='photo',
            field=models.ImageField(upload_to='images/'),
        ),
        migrations.AlterField(
            model_name='enseigne',
            name='photo',
            field=models.ImageField(upload_to='images/'),
        ),
    ]