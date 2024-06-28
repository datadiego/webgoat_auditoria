# (A3) Injection

## Lesson 2

### Desarrollo

Debemos acceder al departamento del empleado "Bob Franco" mediante una consulta SQL.

Para poder realizar la consulta usaremos el comando `SELECT`:

```sql
SELECT columna FROM tabla WHERE condiciones

-- Ejemplo
SELECT * FROM employees WHERE userid='96134'
SELECT first_name FROM employees WHERE userid='96134'
SELECT department FROM employees WHERE first_name='Bob' AND last_name='Franco'
```

### Solución:

Para completar el ejercicio debemos ingresar el siguiente comando SQL:

```sql
SELECT department FROM employees WHERE userid='96134'
```

## Lesson 3

### Desarrollo

Debemos modificar el departamento del empleado "Bob Franco" mediante una consulta SQL a "Sales".

Para poder realizar la consulta usaremos el comando `UPDATE`:

```sql
UPDATE tabla SET columna='valor' WHERE condiciones

-- Ejemplo
UPDATE employees SET first_name = 'Mario' WHERE userid='96134'
```

### Solución:

Para completar el ejercicio debemos ingresar el siguiente comando SQL:

```sql
UPDATE employees SET department='Sales' WHERE userid=96134
```

## Lesson 4

Debemos añadir una columna "phone(varchar(20))" a la tabla "employees".

Para poder realizar la consulta usaremos el comando `ALTER TABLE`:

```sql
ALTER TABLE tabla ADD columna tipo

-- Ejemplo
ALTER TABLE employees ADD hobby varchar(20)
```

### Solución:

Para completar el ejercicio debemos ingresar el siguiente comando SQL:

```sql
ALTER TABLE employees ADD phone varchar(20)
```

Lesson 5

### Desarrollo

Debemos dar permisos al usuario "unauthorized_user" en la tabla "grant_rigths".

Para poder realizar la consulta usaremos el comando `GRANT`:

```sql
GRANT privilegio ON obj TO usuario
```

Donde:

- `privilegio`: Es el permiso que se desea otorgar. Puede ser `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `ALL`.
- `obj`: Es el objeto al que se le otorga el permiso. Puede ser una tabla, vista, procedimiento almacenado, etc.
- `usuario`: Es el usuario al que se le otorga el permiso.

### Solución:

Para completar el ejercicio debemos ingresar el siguiente comando SQL:

```sql
GRANT SELECT ON grant_rigths TO unauthorized_user
```

## Lesson 9

### Desarrollo

