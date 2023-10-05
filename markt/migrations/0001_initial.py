# Generated by Django 4.1.2 on 2023-09-26 18:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_read', models.BooleanField(default=False)),
                ('message', models.TextField()),
                ('almo', models.TextField()),
                ('date_a', models.TextField()),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Sanf',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('bine', models.CharField(max_length=100)),
                ('img_trhl', models.ImageField(blank=True, null=True, upload_to='images/')),
                ('img_persone', models.ImageField(blank=True, null=True, upload_to='images/')),
            ],
        ),
        migrations.CreateModel(
            name='prodect',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('price', models.IntegerField(blank=True, default=0)),
                ('img_trhl', models.ImageField(blank=True, null=True, upload_to='images/')),
                ('sanf', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='markt.sanf')),
            ],
            options={
                'permissions': (('can_add_prodect', 'can_view_prodect'),),
            },
        ),
    ]
