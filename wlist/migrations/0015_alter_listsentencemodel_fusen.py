# Generated by Django 5.0.6 on 2024-12-27 08:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wlist', '0014_alter_listsentencemodel_eval'),
    ]

    operations = [
        migrations.AlterField(
            model_name='listsentencemodel',
            name='fusen',
            field=models.BooleanField(blank=True, default=True, null=True),
        ),
    ]
