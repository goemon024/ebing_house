# Generated by Django 5.0.6 on 2024-11-20 05:32

import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wlist', '0007_alter_wordsmodel_img'),
    ]

    operations = [
        migrations.AlterField(
            model_name='memomodel',
            name='reg_date',
            field=models.DateField(blank=True, default=django.utils.timezone.now, null=True),
        ),
    ]
