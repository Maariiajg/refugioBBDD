use refugio;
-- Países
insert into pais(nombre) values
('España'),
('Argentina'),
('México'),
('Colombia');

-- Provincias
insert into provincia(nombre, id_pais) values
('Madrid', 1),
('Barcelona', 1),
('Buenos Aires', 2),
('Ciudad de México', 3),
('Antioquia', 4);

-- Localidades
insert into localidad(nombre, id_provincia) values
('Madrid', 1),
('Hospitalet de Llobregat', 2),
('La Plata', 3),
('Coyoacán', 4),
('Medellín', 5);

-- Direcciones
insert into direccion(tipo_via, nombre, num, id_localidad) values
('Calle', 'Gran Vía', 45, 1),
('Avenida', 'Diagonal', 300, 2),
('Calle', '7', 1234, 3),
('Calle', 'Francisco Sosa', 23, 4),
('Carrera', '43A', 15, 5),
('Avenida', 'de América', 20, 1),
('Plaza', 'Cataluña', 10, 2);

-- Personas
insert into persona(dni, nombre, appelido1, apellido2, id_direccion, telefono, fecha_nac, email) values
('12345678A', 'Ana', 'García', 'López', 1, '612345678', '1985-04-12', 'ana.garcia@example.com'),
('87654321B', 'Luis', 'Martínez', 'Pérez', 2, '698765432', '1990-11-05', 'luis.martinez@example.com'),
('11223344C', 'María', 'Fernández', 'Sánchez', 3, '600112233', '1978-07-22', 'maria.fernandez@example.com'),
('22334455D', 'Carlos', 'Rodríguez', 'Gómez', 4, '601234567', '1982-09-17', 'carlos.rodriguez@example.com'),
('33445566E', 'Sofía', 'Hernández', 'Ramírez', 5, '602345678', '1995-02-10', 'sofia.hernandez@example.com'),
('44556677F', 'Javier', 'Lopez', 'Torres', 6, '603456789', '1970-06-30', 'javier.lopez@example.com'),
('55667788G', 'Lucía', 'González', 'Diaz', 7, '604567890', '1988-12-25', 'lucia.gonzalez@example.com');

-- Usuarios
insert into usuario(dni_usuario, tipo_participacion) values
('12345678A', 'Adoptante'),
('87654321B', 'Voluntario'),
('33445566E', 'Adoptante'),
('55667788G', 'Voluntario');

-- Empleados
insert into empleado(dni_empleado, salario) values
('11223344C', 1800.00),
('22334455D', 1600.00),
('44556677F', 1750.00);

-- Cuidadores
insert into cuidador(dni_cuidador, titulo) values
('11223344C', 'Veterinaria'),
('22334455D', 'Técnico en cuidado animal');

-- Gestores
insert into gestor(dni_gestor) values
('44556677F'),
('22334455D');

-- Razas
insert into raza(nombre, especie) values
('Labrador Retriever', 'Perro'),
('Siames', 'Gato'),
('Bulldog Francés', 'Perro'),
('Persa', 'Gato');

-- Animales
insert into animal(animal, raza, edad, estado_salud, fecha_ingreso) values
('Max', 1, 4, 'Saludable', '2024-01-15'),
('Luna', 2, 2, 'Recuperándose', '2024-03-10'),
('Rocky', 3, 3, 'Saludable', '2023-11-25'),
('Misu', 4, 1, 'En observación', '2024-04-05'),
('Bobby', 1, 7, 'Saludable', '2023-12-01');

-- Cuida
insert into cuida(dni_cuidador, id_animal, fecha, observaciones) values
('11223344C', 1, '2024-04-20', 'Revisión rutinaria, sin problemas.'),
('11223344C', 2, '2024-04-22', 'Tratamiento en curso, mejorando.'),
('22334455D', 3, '2024-04-15', 'Chequeo general, sin novedades.'),
('22334455D', 4, '2024-04-18', 'Monitorizando signos vitales.'),
('11223344C', 5, '2024-04-19', 'Vacunación realizada.');

-- Adopciones
insert into adopcion(fecha, dni_gestor, dni_usuario, id_animal) values
('2024-05-01', '44556677F', '87654321B', 1),
('2024-05-10', '22334455D', '55667788G', 3);

-- Pagos
insert into pago(importe, id_adopcion) values
(150.00, 1),
(180.00, 2);

-- Entregas
insert into entrega(id_direccion, dni_gestor, dni_usuario, id_animal) values
(1, '44556677F', '33445566E', 1),
(6, '22334455D', '12345678A', 3);
