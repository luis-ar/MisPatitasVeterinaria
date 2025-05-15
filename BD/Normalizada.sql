-- USUARIO
CREATE TABLE usuario (
  idUsuario INT AUTO_INCREMENT PRIMARY KEY,
  nombreUsuario VARCHAR(50) NOT NULL,
  correoUsuario VARCHAR(100) NOT NULL,
  telefono CHAR(9) NOT NULL,
  contraseña BLOB NOT NULL,
  usuario_creacion VARCHAR(255),
  usuario_modificacion VARCHAR(255),
  fecha_creacion TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

-- RAZA (nueva tabla para normalización de razaMascota)
CREATE TABLE raza (
  idRaza INT AUTO_INCREMENT PRIMARY KEY,
  nombreRaza VARCHAR(50) NOT NULL
);

-- MASCOTA
CREATE TABLE mascota (
  idMascota INT AUTO_INCREMENT PRIMARY KEY,
  idUsuario INT NOT NULL,
  idRaza INT NOT NULL,
  nombreMascota VARCHAR(50) NOT NULL,
  fechaNacimiento DATE NOT NULL,
  descripcion VARCHAR(150) NOT NULL,
  sexo CHAR(1) NOT NULL,
  foto BLOB NOT NULL,
  usuario_creacion VARCHAR(255),
  usuario_modificacion VARCHAR(255),
  fecha_creacion TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
  FOREIGN KEY (idRaza) REFERENCES raza(idRaza)
);

-- VETERINARIO
CREATE TABLE veterinario (
  idVeterinario INT AUTO_INCREMENT PRIMARY KEY,
  nombreVeterinario VARCHAR(50) NOT NULL,
  correo VARCHAR(100) NOT NULL,
  contraseña BLOB NOT NULL,
  usuario_creacion VARCHAR(255),
  usuario_modificacion VARCHAR(255),
  fecha_creacion TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

-- HISTORIAL CLÍNICO
CREATE TABLE historial (
  idHistorial INT AUTO_INCREMENT PRIMARY KEY,
  idMascota INT NOT NULL,
  idVeterinario INT NOT NULL,
  fechaHistorial DATE NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  tratamiento VARCHAR(200) NOT NULL,
  usuario_creacion VARCHAR(255),
  usuario_modificacion VARCHAR(255),
  fecha_creacion TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (idMascota) REFERENCES mascota(idMascota),
  FOREIGN KEY (idVeterinario) REFERENCES veterinario(idVeterinario)
);

-- SERVICIO
CREATE TABLE servicio (
  idServicio INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(250) NOT NULL,
  foto BLOB NOT NULL,
  usuario_creacion VARCHAR(255),
  usuario_modificacion VARCHAR(255),
  fecha_creacion TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

-- RELACIÓN ENTRE MASCOTA Y SERVICIO (nuevo)
CREATE TABLE mascota_servicio (
  idMascota INT NOT NULL,
  idServicio INT NOT NULL,
  fechaServicio DATE NOT NULL,
  PRIMARY KEY (idMascota, idServicio, fechaServicio),
  FOREIGN KEY (idMascota) REFERENCES mascota(idMascota),
  FOREIGN KEY (idServicio) REFERENCES servicio(idServicio)
);

-- CONTACTO
CREATE TABLE contacto (
  idContacto INT AUTO_INCREMENT PRIMARY KEY,
  idUsuario INT,
  mensaje VARCHAR(250) NOT NULL,
  usuario_creacion VARCHAR(255),
  usuario_modificacion VARCHAR(255),
  fecha_creacion TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  fecha_modificacion TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);
