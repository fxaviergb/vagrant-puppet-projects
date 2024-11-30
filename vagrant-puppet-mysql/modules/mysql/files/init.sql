-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS mi_base_datos;

-- Crear el usuario fgarnica con su contraseña
CREATE USER IF NOT EXISTS 'fgarnica'@'localhost' IDENTIFIED BY 'secure_password';

-- Otorgar privilegios al usuario fgarnica
GRANT ALL PRIVILEGES ON mi_base_datos.* TO 'fgarnica'@'localhost';
FLUSH PRIVILEGES;

-- Usar la base de datos
USE mi_base_datos;

-- Crear la tabla personas
CREATE TABLE IF NOT EXISTS personas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50),
  edad INT,
  correo VARCHAR(100)
);

-- Insertar registros de ejemplo en la tabla personas
INSERT INTO personas (nombre, edad, correo) VALUES
  ('Juan Perez', 30, 'juan.perez@example.com'),
  ('Maria Lopez', 25, 'maria.lopez@example.com'),
  ('Carlos Garcia', 35, 'carlos.garcia@example.com'),
  ('Ana Rodriguez', 28, 'ana.rodriguez@example.com'),
  ('Luis Martinez', 40, 'luis.martinez@example.com');
