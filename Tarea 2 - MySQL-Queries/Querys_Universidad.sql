use universidad;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre ASC;
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento >= '1999-01-01'AND fecha_nacimiento < '2000-01-01';
SELECT apellido1, apellido2, nombre, nif FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT *FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY persona.apellido1, persona.apellido2, persona.nombre ASC;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE nif LIKE '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON profesor.id_departamento = departamento.id JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre LIKE '%Grado en Ingeniería Informatica (plan 2015)%';
SELECT DISTINCT persona.*, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;
-- LEFT JOIN - RIGHT JOIN
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN departamento ON departamento.id = profesor.id_departamento WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre ASC;
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE persona.tipo = "profesor" AND profesor.id_departamento IS NULL;
SELECT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_profesor IS NULL;
SELECT persona.nombre,persona.apellido1, persona.apellido2 FROM persona LEFT JOIN asignatura ON asignatura.id_profesor = persona.id WHERE persona.tipo = "profesor" AND asignatura.id_profesor IS NULL;
SELECT asignatura.nombre FROM profesor RIGHT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE curso IS NULL; 
-- Consultas resumen
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento >= '1999-01-01'AND fecha_nacimiento < '2000-01-01';
SELECT COUNT(*), departamento.nombre FROM profesor JOIN departamento ON profesor.id_departamento = departamento.id  GROUP BY departamento.nombre ORDER BY COUNT(*) DESC;
SELECT COUNT(profesor.id_profesor), departamento.nombre FROM profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id GROUP BY departamento.nombre;
SELECT COUNT(asignatura.id), grado.nombre FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY COUNT(*) DESC;
SELECT COUNT(asignatura.id), grado.nombre FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id) > 40;
SELECT grado.nombre, asignatura.nombre, asignatura.creditos FROM asignatura JOIN grado ON grado.id = asignatura.id_grado GROUP BY asignatura.nombre ORDER BY asignatura.creditos DESC;
SELECT COUNT(*) AS total_alumnos, curso_escolar.anyo_inicio FROM alumno_se_matricula_asignatura JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
SELECT COUNT(*) AS total_asignaturas, persona.id, persona.nombre, persona.apellido1, persona.apellido2 FROM asignatura JOIN persona ON persona.id = asignatura.id_profesor GROUP BY persona.id, persona.nombre, persona.apellido1, persona.apellido2; 
SELECT * FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona);
-- SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL AND persona.tipo = 'profesor';




  