vagrant ssh

mysql -u fgarnica -p
# Ingresa la contraseña: secure_password

-- Comprobar las bases de datos
SHOW DATABASES;

-- Usar la base de datos
USE mi_base_datos;

-- Mostrar los registros en la tabla personas
SELECT * FROM personas;
