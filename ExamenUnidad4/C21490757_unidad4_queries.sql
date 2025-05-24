UPDATE estudiante
SET direccion = 'CALLE NOVENA #9'
WHERE id_estudiante = 4;
SELECT E.Id_Estudiante,E.nombre as Nombre_Estudiante,E.direccion as direccion FROM ESTUDIANTE E
--Cambiar el correo de un profesor usando la funcion concatenar-- 
UPDATE Profesores
set email= CONCAT(nombreprofesor,apellido,'@tecnologico.mx')
where id_profesor= 2;
Select p.id_profesor,p.Nombreprofesor as NombreProfe,p.apellido as ApellidoProfe,p.email from profesores p;
--Cambiar hora de inicio y hora de fin de un curso--
UPDATE horarios
SET horainicio = '09:00', horafin = '11:00'
WHERE id_cursos = 2;
select h.horainicio, h.horafin, h.id_cursos from horarios h;
--Borramos la columno id_aulas ya que esta completamente en null y no se esta usando--
alter table horarios
drop column id_aulas
select *from horarios


--CONSULTAS--
--Consulta que muestere el nombre de un estudiante, a que carrera pertenece y que curso lleva--
SELECT e.nombre AS nombre_estudiante, c.nombrecarrera AS carrera, cu.nombrecurso AS curso
FROM estudiante e
INNER JOIN carrerasestudiante ce ON e.id_estudiante = ce.id_estudiante
INNER JOIN carreras c ON ce.id_carrera = c.id_carrera
INNER JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos cu ON i.id_cursos = cu.id_cursos;
--Consulta que muestra el nombre completo de un alumno,el curso al que pertenece,el profesor que lo imparte 
-- y la calificacion que tiene--
SELECT Concat(e.nombre,'',e.apellido) as nombre_estudiante, cu.nombrecurso AS curso,
  CONCAT(p.nombreprofesor, ' ', p.apellido) AS Profesor,i.calificacion FROM estudiante e
INNER JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos cu ON i.id_cursos = cu.id_cursos
INNER JOIN cursosprofesores cp ON cu.id_cursos = cp.id_cursos
INNER JOIN profesores p ON cp.id_profesor = p.id_profesor
WHERE e.id_estudiante = 3;
--Consulta que muestre el nombre de un estudiante,el curso al que pertence y la fecha en la que se inscribio--
SELECT e.nombre AS nombre_estudiante,c.nombrecurso AS curso, i.fechainscripcion
FROM estudiante e
INNER JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos c ON i.id_cursos = c.id_cursos
WHERE e.id_estudiante = 1;
--1.--
SELECT E.nombre, E.apellido 
FROM estudiante E;

-- 2.- Selección de cursos con 3 créditos
SELECT nombrecurso FROM cursos
WHERE creditos = 3;

--3.-INNER JOIN: Obtén una lista que muestre el nombre del estudiante y el nombre del curso en el que está inscrito
SELECT E.nombre AS nombre_estudiante, C.nombrecurso AS curso 
FROM estudiante E
INNER JOIN inscripciones I ON E.id_estudiante = I.id_estudiante
INNER JOIN cursos C ON I.id_cursos = C.id_cursos;

-- 4.-LEFT JOIN: Muestra todos los estudiantes y, si están inscritos en algún curso, el nombre del curso.
-- Si el estudiante no está inscrito en ningún curso, el campo del nombre del curso es NULL
SELECT E.nombre AS Nombre_Estudiante, C.nombrecurso AS Nombre_Curso 
FROM estudiante E
LEFT JOIN inscripciones I ON E.id_estudiante = I.id_estudiante
LEFT JOIN cursos C ON C.id_cursos = I.id_cursos;

--5.-RIGHT JOIN: Lista todos los cursos y, si tienen estudiantes inscritos, el nombre de los estudiantes.
--Muestra todos los cursos, incluso si no tienen estudiantes inscritos actualmente--
SELECT e.nombre AS nombre_estudiante, c.nombrecurso AS curso 
FROM estudiante e
RIGHT JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
RIGHT JOIN cursos c ON i.id_cursos = c.id_cursos;


--6. GROUP BY y COUNT: Calcula cuántos estudiantes están inscritos en cada curso--
--Muestra el nombre del curso y la cantidad de estudiantes--
SELECT c.nombrecurso AS Nombre_Curso, COUNT(i.id_estudiante) AS Cantidad_De_Estudiantes FROM cursos c
LEFT JOIN inscripciones i ON c.id_cursos = i.id_cursos
GROUP BY c.nombrecurso;

--7. BETWEEN: Encuentra todos los estudiantes que nacieron entre el 1 de enero de 1995 y el 31 de diciembre de 1998.--
SELECT * FROM estudiante 
WHERE fecha_de_nacimiento BETWEEN '1995-01-01' AND '1998-12-31';


--8. ORDER BY: Muestra todos los cursos ordenados alfabéticamente por su nombre--
SELECT *FROM cursos
ORDER BY nombrecurso ASC;

--9.-CTE: Crea una tabla de expresión común que liste el número de inscripciones por estudiante luego--
--consulta esta CTE para encontrar los 3 estudiantes con más inscripciones mostrando el nombre del estudiante-- 
--y el número de inscripciones.--
WITH inscripciones_por_estudiante AS (
SELECT e.id_estudiante, e.nombre, e.apellido, COUNT(i.id_inscripcion) AS total_inscripciones FROM estudiante e
inner JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
GROUP BY e.id_estudiante, e.nombre, e.apellido)
SELECT nombre as Nombre_Alumno, apellido as Apellido_Estudiante, total_inscripciones
FROM inscripciones_por_estudiante
ORDER BY total_inscripciones DESC
LIMIT 3;

--10.- Consulta Compleja 1: Para cada departamento, muestra el nombre del departamento 
--y el nombre del curso con la mayor cantidad de estudiantes inscritos.--
SELECT d.nombredepartamento,c.nombrecurso, COUNT(i.id_estudiante) AS total_inscritos FROM departamento d
INNER JOIN cursos c ON c.id_departamento = d.id_departamento
LEFT JOIN inscripciones i ON i.id_cursos = c.id_cursos
GROUP BY d.id_departamento, d.nombredepartamento, c.id_cursos, c.nombrecurso
HAVING COUNT(i.id_estudiante) = (
SELECT MAX(contador)
 FROM ( SELECT COUNT(i2.id_estudiante) AS contador FROM cursos c2
LEFT JOIN inscripciones i2 ON i2.id_cursos = c2.id_cursos WHERE c2.id_departamento = d.id_departamento
GROUP BY c2.id_cursos) AS subconsulta
) ORDER BY d.nombredepartamento;

-- 11.- Consulta Compleja 2: Encuentra a los profesores que imparten más de dos 
--cursos, mostrando su nombre, apellido y la cantidad de cursos que imparten.--
--INSERT PARA QUE FUNCIONE LA CONSULTA--
	
SELECT p.nombreprofesor,p.apellido,COUNT(cp.id_cursos) AS cantidad_cursos FROM profesores p
JOIN cursosprofesores cp ON p.id_profesor = cp.id_profesor
GROUP BY p.id_profesor, p.nombreprofesor, p.apellido
HAVING COUNT(cp.id_cursos) > 2
ORDER BY cantidad_cursos DESC;
--12.- Consulta Compleja 3: Lista los nombres de los programas de estudio y, para cada programa--
--el nombre del curso con el promedio de calificación más alto.--
SELECT p.nombreprograma,c.nombrecurso,ROUND(AVG(i.calificacion), 2) AS promedio FROM programasestudio p
INNER JOIN programascursos pc ON p.id_programa = pc.id_programa
INNER JOIN cursos c ON pc.id_cursos = c.id_cursos
inner JOIN inscripciones i ON c.id_cursos = i.id_cursos
GROUP BY p.id_programa, p.nombreprograma, c.id_cursos, c.nombrecurso
HAVING AVG(i.calificacion) = (SELECT MAX(prom) FROM (SELECT AVG(i2.calificacion) AS prom FROM programascursos pc2
INNER JOIN cursos c2 ON pc2.id_cursos = c2.id_cursos
INNER JOIN inscripciones i2 ON c2.id_cursos = i2.id_cursos
WHERE pc2.id_programa = p.id_programa
GROUP BY c2.id_cursos) AS sub)
ORDER BY p.nombreprograma;

