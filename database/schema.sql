CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(15) NOT NULL,
    apellido_materno VARCHAR(15) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    correo VARCHAR(40)
);

CREATE TABLE servicios (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    nombre_servicio VARCHAR(40) NOT NULL,
    precio_unitario INT NOT NULL,
    descripcion TEXT
);

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(40) NOT NULL,
    apellido_paterno VARCHAR(20) NOT NULL,
    apellido_materno VARCHAR(20) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    puesto VARCHAR(20),
    salario DECIMAL(10,2) NOT NULL
);

CREATE TABLE eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_evento DATE NOT NULL,
    hora_evento TIME NOT NULL,
    hora_fin TIME,
    tipo_evento VARCHAR(20) NOT NULL,
    estado_evento VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detalles_evento (
    id_detalles_evento INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT,
    id_servicio INT,
    cantidad INT,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

CREATE TABLE asignacion_empleados (
    id_asignacion_empleado INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    id_evento INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento)
);

CREATE TABLE pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT,
    fecha_pago DATE,
    monto DECIMAL(10,2),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento)
);
