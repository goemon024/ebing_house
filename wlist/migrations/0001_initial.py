# Generated by Django 5.0.6 on 2024-07-07 08:37

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='WordsModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('word', models.CharField(max_length=10)),
                ('mean1', models.CharField(blank=True, max_length=15, null=True)),
                ('mean2', models.CharField(blank=True, max_length=200, null=True)),
                ('reg_date', models.DateField(blank=True, null=True)),
            ],
        ),
    ]
