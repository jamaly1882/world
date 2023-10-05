
@echo off
cd "C:\Users\pc\Desktop\world\backups"
"C:\xampp\mysql\bin\mysqldump" -u root -h localhost -pEgypt-+20!! --no-tablespaces --databases markt > backup.sql

