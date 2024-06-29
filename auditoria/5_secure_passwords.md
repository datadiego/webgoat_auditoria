## Uso de contraseñas seguras

- Categoria de la vulnerabilidad: A02:2021 – Weak Passwords
- CWE: [CWE-521](https://cwe.mitre.org/data/definitions/521.html)
- [Resolución de Ejercicios en WebGoat](../A7-secure-password.md)

### Descripción

Durante la auditoría se detectó que la aplicación web permite el uso de contraseñas débiles. Un atacante podría aprovechar contraseñas débiles para comprometer la seguridad de la aplicación.

### Explotación de la vulnerabilidad

Dependiendo de la complejidad de la contraseña, un atacante podría adivinar la contraseña de un usuario mediante fuerza bruta o diccionario. Por ejemplo, si un usuario utiliza la contraseña `123456`, un atacante podría adivinar la contraseña en pocos intentos.

Algunos patrones de contraseñas débiles son:

- Uso de contraseñas comunes como `123456`, `password`, `qwerty`, `admin`, `root`, etc.
- Uso de contraseñas cortas o simples como `abc123`, `qwerty123`, `password123`, etc.
- Uso de información personal como nombre, fecha de nacimiento, número de teléfono, etc.
- Repetir combinaciones de caracteres como `aaaaaa`, `123123`, `qwertyqwerty`, etc.

Ejemplos:

Contraseña: 1234
Estimated guesses needed to crack your password: 8

Contraseña: password
Estimated guesses needed to crack your password: 3

Contraseña: admin
Estimated guesses needed to crack your password: 716

### Recomendación

Se recomienda implementar políticas de contraseñas seguras para mitigar el riesgo de adivinación de contraseñas. Algunas recomendaciones para crear contraseñas seguras son:

- Utilizar contraseñas de al menos 8 caracteres de longitud.
- Utilizar una combinación de caracteres alfanuméricos, caracteres especiales y números.
- Evitar el uso de contraseñas comunes o fáciles de adivinar.
- No utilizar información personal como nombre, fecha de nacimiento, número de teléfono, etc.

Ejemplos:

hyper!text808
Estimated guesses needed to crack your password: 1125400010000

434g3t%r3kt
Estimated guesses needed to crack your password: 120000010000

### Referencias

- [OWASP Top 10 2021: A02:2021 – Weak Passwords](https://owasp.org/www-project-top-ten/2021/A02_2021-Weak_Passwords)
- [CWE-521: Weak Password Requirements](https://cwe.mitre.org/data/definitions/521.html)
