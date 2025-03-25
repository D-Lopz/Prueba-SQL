SELECT nombre 
FROM clientes 
WHERE id IN (SELECT cliente_id FROM proyectos);

SELECT id, nombre, 
       (SELECT COUNT(*) FROM sprints WHERE proyecto_id = proyectos.id) AS total_sprints
FROM proyectos;

SELECT tipo, COUNT(*) AS total_proyectos 
FROM proyectos 
GROUP BY tipo;

SELECT nombre FROM administradores 
INTERSECT 
SELECT nombre FROM clientes;

select nombre from administradores
where telefono in (select telefono from clientes);

SELECT cliente_id 
FROM proyectos 
GROUP BY cliente_id 
HAVING COUNT(*) > 1;

SELECT nombre, 
       (SELECT COUNT(*) FROM tareas 
        WHERE sprint_id IN (SELECT id FROM sprints WHERE proyecto_id = proyectos.id)) 
        AS total_tareas
FROM proyectos;

SELECT nombre, email FROM administradores
UNION 
SELECT nombre, email FROM clientes;

SELECT proyecto_id 
FROM sprints 
GROUP BY proyecto_id 
HAVING COUNT(*) > 3;

SELECT nombre 
FROM proyectos 
WHERE id IN (
    SELECT proyecto_id 
    FROM sprints 
    WHERE id IN (
        SELECT sprint_id 
        FROM tareas 
        WHERE estado = 'Pendiente'
    )
);

SELECT id, nombre, 
       (SELECT COUNT(*) 
        FROM tareas 
        WHERE sprint_id IN (
            SELECT id FROM sprints WHERE proyecto_id = proyectos.id
        ) AND estado = 'Completado') AS total_tareas_completadas
FROM proyectos;