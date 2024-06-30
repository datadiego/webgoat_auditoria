## Introducción

Este informe de auditoría ha sido realizado durante el bootcamp de ciberseguridad 2024 en Keepcoding. El objetivo de la auditoría es identificar y analizar las vulnerabilidades de seguridad presentes en la aplicación web de OWASP WebGoat.

Se pueden consultar las vulnerabilidades analizadas en el informe.

Se pueden consultar las resoluciones de los ejercicios de WebGoat en el [repositorio](https://github.com/datadiego/webgoat_auditoria/tree/master/resolucion_ejercicios) del proyecto.

## Metodología

Se han utilizado herramientas de análisis como `nmap`, `whatweb`, `Nikto` y `dirbuster`, así como técnicas de fuzzing en las solicitudes HTTP, analisis de respuestas y captura de tráfico con `Burp Suite` y `Wireshark`. Otras técnicas incluyen el análisis del código fuente en el frontend, junto con la inspección de elementos en el navegador y solicitudes HTTP.

## Alcance de la auditoría

La auditoría de seguridad se ha centrado en la identificación, análisis y explotación de las siguientes vulnerabilidades:

- A01:2021 - Broken Access Control - IDOR
- A03:2021 - Injection - SQL Injection
- A03:2021 - Injection - XSS (Cross Site Scripting)
- A05:2021 - Security Misconfiguration - XXE (XML External Entity)
- A06:2021 - Outdated Components
- A07:2021 - Identification and Authentication Failures - Insecure Login
- A07:2021 - Identification and Authentication Failures - Weak Password Policy

## Ambito de la auditoría

La auditoría de seguridad se ha centrado en la identificación de vulnerabilidades en la aplicación web de OWASP WebGoat. La aplicación web ha sido desplegada en un contenedor Docker y se ha accedido a ella a través de un navegador web.

## Indice

- Introducción
- Metodología
- Ambito
- Alcance
- Conclusiones
- Vulnerabilidades analizadas
  - SQL Injection
  - Cross Site Scripting (XSS)
  - Security Misconfiguration
  - Outdated Components
  - Weak Password Policy
  - Insecure Login
  - Insecure Direct Object Reference (IDOR)
- Referencias
- Anexos


## Conclusiones

De las vulnerabilidades analizadas, 4 son críticas, 2 son de alta severidad y 1 es de severidad media. Se identificaron violaciones de principios de seguridad como la autenticación y autorización, la confidencialidad, la integridad y la disponibilidad de la información. Se recomienda aplicar las mitigaciones propuestas en cada una de las vulnerabilidades para mejorar la seguridad de la aplicación web.

[Chart 1](../imgs/chart_pie.png)

[Chart 2](../imgs/chart_bar.png)

## Information Gathering

El escaneo de servicios muestra el siguiente resultado:

```plaintext
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-06-28 16:52 CEST
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00040s latency).
Not shown: 997 closed tcp ports (conn-refused)
PORT     STATE SERVICE     VERSION
22/tcp   open  ssh         OpenSSH 9.7p1 Debian 5 (protocol 2.0)
8080/tcp open  http-proxy
9090/tcp open  zeus-admin?
2 services unrecognized despite returning data.
```

Nos devuelve dos fingerprints de servicios en los puertos 8080 y 9090. El servicio en el puerto 8080 parece ser un servidor web, mientras que el servicio en el puerto 9090 no se puede identificar. Nikto tampoco ha podido identificar el servidor web en el puerto 8080.

Nikto nos devuelve el siguiente analisis:
```
- Nikto v2.1.5
---------------------------------------------------------------------------
+ Target IP:          172.17.0.2
+ Target Hostname:    172.17.0.2
+ Target Port:        8080
+ Start Time:         2024-06-29 09:21:21 (GMT2)
---------------------------------------------------------------------------
+ Server: No banner retrieved
+ The anti-clickjacking X-Frame-Options header is not present.
+ 6544 items checked: 0 error(s) and 1 item(s) reported on remote host
+ End Time:           2024-06-29 09:21:38 (GMT2) (17 seconds)
---------------------------------------------------------------------------
+ 1 host(s) tested
```

Detectamos dos servicios en los puertos 8080 y 9090. El servicio en el puerto 8080 parece ser un servidor web, mientras que el servicio en el puerto 9090 no se puede identificar. Nikto tampoco ha podido identificar el servidor web en el puerto 8080.

En el frontend de la aplicación web encontramos las siguientes librerias:

```js
jquery: 'libs/jquery.min',
jqueryvuln: 'libs/jquery-2.1.4.min',
jqueryuivuln: 'libs/jquery-ui-1.10.4',
jqueryui: 'libs/jquery-ui.min',
underscore: 'libs/underscore-min',
backbone: 'libs/backbone-min',
bootstrap: 'libs/bootstrap.min',
text: 'libs/text',
templates: 'goatApp/templates',
polyglot: 'libs/polyglot.min',
search: 'search'
```


![Librerias](../imgs/libs.png)

# Vulnerabilidades

## Inyección de SQL

- Categoria de la vulnerabilidad: A03:2021 – Injection
- CWE: [CWE-89](https://cwe.mitre.org/data/definitions/89.html)
- #CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H (Crítico)

### Descripción

Durante la auditoría se detectó que la aplicación web es vulnerable a inyección de SQL. Un atacante podría inyectar código SQL en los campos de texto de la aplicación y obtener información sensible de la base de datos.

### Explotación de la vulnerabilidad

En los campos `Employee Name` y `Employee ID` se pueden inyectar sentencias SQL para obtener información de la base de datos.

Si ingresamos `3SL99A' or '1'='1` como id de empleado, la consulta final inyectada sería:

```sql
SELECT * FROM employees WHERE last_name='Smith' AND auth_tan='3SL99A' or '1'='1'
```

En cuanto al nombre del empleado, da igual el valor ingresado, siempre devolverá la lista completa de empleados.

![Inyección exitosa](../imgs/sql0.png)

### Post-explotación

Una vez que el atacante obtiene acceso a la base de datos, puede realizar consultas adicionales para obtener información sensible, como credenciales de usuarios, información de salarios o departamentos.

Adicionalmente, el usuario podría modificar o eliminar registros de la base de datos, lo que podría causar daños irreparables a la organización.

Entradas como las siguientes:

```sql
3SL99A' or '1'='1'; -- 
3SL99A' or '1'='1'; DROP TABLE employees; --
3SL99A' or '1'='1'; UPDATE employees SET salary=10000000 WHERE last_name='Smith';--
```

Son ejemplos de consultas que un atacante podría realizar para obtener información sensible o causar daños a la base de datos.

### Explotación de los principios CIA vulnerados:

Podemos apreciar los tres principios de la seguridad de la información vulnerados en la explotación de la vulnerabilidad de inyección de SQL:

![Vulneración de la confidencialidad](../imgs/sql0.png)
![Vulneración de la integridad](../imgs/sql1.png)
![Vulneración de la disponibilidad](../imgs/sql2.png)
![Vulneración de la autenticidad](../imgs/sql3.png)

### Posibles mitigaciones

Para mitigar esta vulnerabilidad, se recomienda utilizar consultas parametrizadas en lugar de concatenar directamente los valores ingresados por el usuario en las consultas SQL.

Además, se recomienda validar y sanitizar las entradas de los usuarios antes de ejecutar cualquier consulta en la base de datos.

### Referencias

- [CWE-89: Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')](https://cwe.mitre.org/data/definitions/89.html)
- [OWASP: SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection)
- [SQL Injection Cheat Sheet](https://portswigger.net/web-security/sql-injection/cheat-sheet)
- [SQL Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)

## Cross Site Scripting (XSS)

- Categoría de la vulnerabilidad: A07:2021 – Cross Site Scripting (XSS)
- CWE: [CWE-79](https://cwe.mitre.org/data/definitions/79.html)
- #CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N (Alto)

### Descripción

Durante la auditoría se detectó que la aplicación web es vulnerable a Cross Site Scripting (XSS). Un atacante podría inyectar código JavaScript en los campos de texto de la aplicación y ejecutarlo en el navegador de otros usuarios u obtener información sensible de la sesión como cookies o credenciales.

### Explotación de la vulnerabilidad

En el campo para la tarjeta de crédito, se puede inyectar código JavaScript para obtener información sensible de la sesión del usuario.

Si ingresamos el siguiente código en el campo de la tarjeta de crédito:

```html
<script>alert("hola mundo")</script>
```

Podemos inyectar exitosamente código JavaScript en la aplicación web.

![Inyección de js](../imgs/xss0.png)

### Post-explotación

Una vez que el atacante ha inyectado código JavaScript en la aplicación web, puede realizar diferentes acciones maliciosas como:

- Obtener acceso a diferentes elementos de la página web.

```html
<script>alert(document.cookie)</script>
<script>alert(JSON.stringify(localStorage))</script>
<script>alert(JSON.stringify(sessionStorage))</script>
```

Exposiciones de información:

![Exposición de cookies](../imgs/xss1.png)
![Exposición de objeto document](../imgs/xss2.png)

- Redireccionar a una página maliciosa.

```html
<script>window.location.href = "http://www.paginamaliciosa.com"</script>
```

### Posibles mitigaciones

Para mitigar esta vulnerabilidad, se recomienda:

- Validar y sanitizar las entradas de los usuarios antes de mostrarlas en la página web.
- Utilizar funciones de escape de caracteres especiales para evitar la ejecución de código JavaScript.
- Implementar Content Security Policy (CSP) para limitar los orígenes de los scripts que se pueden ejecutar en la página web.
- Utilizar el atributo `HttpOnly` en las cookies para evitar que sean accedidas por código JavaScript.
- Utilizar el atributo `SameSite` en las cookies para limitar el envío de cookies en peticiones cross-site.

### Referencias

- [OWASP: Cross Site Scripting (XSS)](https://owasp.org/www-community/attacks/xss/)
- [Cross Site Scripting Cheat Sheet](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet)
- [Cross Site Scripting Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html)
- [CWE-79: Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')](https://cwe.mitre.org/data/definitions/79.html)
- [OWASP: Content Security Policy (CSP)](https://owasp.org/www-project-secure-headers/)
- [SameSite cookies explained](https://web.dev/samesite-cookies-explained/)
- [SameSite cookies: Lax by default](https://web.dev/samesite-cookies-explained/#lax-by-default)
## Security Misconfiguration (XXE)

- Categoría de la vulnerabilidad: A05:2021 – Security Misconfiguration
- CWE: [CWE-611](https://cwe.mitre.org/data/definitions/611.html)
- #CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H (Crítico)

### Descripción

Durante la auditoría se detectó que la aplicación web es vulnerable a External Entity Injection (XEE). Un atacante podría inyectar entidades externas en los archivos XML de la aplicación.

### Explotación de la vulnerabilidad

Podemos capturar la solicitud con Burp Suite y modificar el XML para inyectar código malicioso. Podemos inyectar código para listar el contenido de un archivo en el servidor:

```xml
<?xml version="1.0"?>
<!DOCTYPE text [
  <!ENTITY js SYSTEM "file:///">
]>
<comment>  
    <text>
        &js;
    </text>
</comment>
```

Petición original y petición modificada:

![Petición original](../imgs/xxe0.png)
![Petición modificada](../imgs/xxe1.png)

### Post-explotación

Una vez que el atacante ha inyectado código malicioso en el XML, puede realizar diferentes acciones maliciosas como:

- Listar el contenido de archivos en el servidor.
- Obtener información sensible del sistema.
- Realizar ataques de denegación de servicio (DoS) al servidor.

### Posibles mitigaciones

Para mitigar esta vulnerabilidad, se recomienda:

- Deshabilitar la resolución de entidades externas en los archivos XML.
- Validar y sanitizar las entradas de los usuarios antes de procesar los archivos XML.
- Utilizar un parser XML seguro que no permita la resolución de entidades externas.

### Referencias

- [OWASP: XML External Entity (XXE) Processing](https://owasp.org/www-community/vulnerabilities/XML_External_Entity_(XXE)_Processing)
- [CWE-611: Improper Restriction of XML External Entity Reference](https://cwe.mitre.org/data/definitions/611.html)
- [XML External Entity (XXE) Cheat Sheet](https://portswigger.net/web-security/xxe)
- [XML External Entity (XXE) Injection](https://owasp.org/www-community/attacks/XML_External_Entity_(XXE)_Processing)

## Componentes no actualizados

- Categoria: A06:2021 – Outdated Components
- CVE: [CVE-2019-11358](https://nvd.nist.gov/vuln/detail/CVE-2019-11358)
- #CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N (Media)

### Descripción

Durante la auditoría se detectó que la aplicación web utiliza componentes con versiones desactualizadas. Un atacante podría aprovechar vulnerabilidades conocidas en las versiones antiguas de los componentes para comprometer la seguridad de la aplicación.

La versión de jquery utilizada en la aplicación web es vulnerable a [CVE-2019-11358](https://nvd.nist.gov/vuln/detail/CVE-2019-11358), que permite a un atacante ejecutar código JavaScript malicioso en el navegador de los usuarios.

### Explotación de la vulnerabilidad

Acceder a las librerías usadas en el frontend es accesible desde el propio navegador, por lo que un atacante podría identificar la versión de jquery utilizada en la aplicación web y buscar vulnerabilidades conocidas en esa versión.

![Librerias](../imgs/libs.png)

Un atacante podría aprovechar la vulnerabilidad en la versión de jquery para inyectar código JavaScript malicioso en la aplicación web. Por ejemplo, si el atacante inyecta el siguiente código en un campo de texto:

```html
<script>alert("hola mundo")</script>
```
![Inyección de js](../imgs/outdated0.png)

El código JavaScript se ejecutará en el navegador de los usuarios que visiten la página web.

### Recomendación

Se recomienda actualizar los componentes de la aplicación web a las versiones más recientes para mitigar el riesgo de explotación de vulnerabilidades conocidas. Además, se recomienda implementar un proceso de gestión de vulnerabilidades para mantener actualizados los componentes de la aplicación web.

### Referencias

- [CVE-2019-11358](https://nvd.nist.gov/vuln/detail/CVE-2019-11358)
- [OWASP Top 10 2017 - A9: Using Components with Known Vulnerabilities](https://owasp.org/www-project-top-ten/2017/A9_2017-Using_Components_with_Known_Vulnerabilities)## Uso de contraseñas seguras

- Categoria de la vulnerabilidad: A02:2021 – Weak Passwords
- CWE: [CWE-521](https://cwe.mitre.org/data/definitions/521.html)
- #CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H (Crítico)

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
## IDOR (Insecure Direct Object Reference)

- Categoría de la vulnerabilidad: A01:2021 – Broken Access Control
- CWE: [CWE-639](https://cwe.mitre.org/data/definitions/639.html)
- #CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:H/I:H/A:H (Crítico)

### Descripción

Durante la auditoría se detectó el envío de información sensible en las solicitudes HTTP, lo que permite a un atacante acceder a información acerca de la gestión de usuarios de la aplicación web y, finalmente, a recursos protegidos de otros usuarios.

La vulnerabilidad rompe los principios de seguridad de la información de confidencialidad e integridad y dispone de un impacto crítico en la aplicación web.

### Explotación de la vulnerabilidad

Un atacante podría aprovechar la vulnerabilidad de IDOR para acceder a recursos protegidos de otros usuarios.

Podemos capturar la solicitud GET mediante un proxy web como Burp Suite o leerla directamente desde el navegador.

![Burp Suite](../imgs/idor0.png)

![Navegador](../imgs/idor2.png)

### Post-explotación

Un atacante puede acceder a recursos protegidos de otros usuarios, como información personal, datos sensibles, o realizar acciones en nombre de otros usuarios modificando la solicitud GET.

![Recursos protegidos](../imgs/idor1.png)

Podemos hacer fuzzing en la solicitud GET para identificar recursos protegidos de otros usuarios.

![Fuzzing](../imgs/idor3.png)

\newpage

Y finalmente modificar la solicitud GET por un POST para modificar recursos protegidos de otros usuarios.

![Fuzzing + Modificar recursos](../imgs/idor4.png)

### Recomendaciones

Limitar el tipo de peticiones HTTP que se pueden realizar a los recursos de la aplicación web y validar la autorización de los usuarios en cada solicitud desde el servidor.

### Referencias

- [OWASP - Insecure Direct Object References](https://owasp.org/www-community/attacks/Insecure_Direct_Object_References)
- [OWASP - Top 10 2017 - A4:2017-Insecure Direct Object References](https://owasp.org/www-project-top-ten/2017/A4_2017-Insecure_Direct_Object_References)
# Login inseguro

- Categoria de la vulnerabilidad: A07:2021-Identification and Authentication Failures 
- CWE: [CWE-287](https://cwe.mitre.org/data/definitions/287.html)
- [Resolución de Ejercicios en WebGoat](../A7-Insecure-login.md)

## Descripción

Durante la auditoría se detectó que la aplicación web no tiene HTTPS habilitado en la página de login, lo que permite a un atacante interceptar las credenciales de los usuarios.

### Explotación de la vulnerabilidad

Utilizando un proxy web como Burp Suite, o un analizador de protocolos como WireShrak podemos capturar las credenciales de los usuarios al momento de autenticarse en la aplicación web.

![Burp Suite](../imgs/login0.png)
![Wireshark](../imgs/login1.png)

### Post-explotación

Una vez que el atacante ha capturado las credenciales de los usuarios, puede realizar diferentes acciones maliciosas como:

- Acceder a la cuenta de los usuarios.
- Realizar acciones en nombre de los usuarios.
- Obtener información sensible de la sesión de los usuarios.
- Realizar ataques de phishing.
- Escalar privilegios en la aplicación web si las credenciales capturadas pertenecen a un usuario con privilegios elevados.
- Realizar ataques de fuerza bruta para obtener las credenciales de otros usuarios.
- Comprometer la confidencialidad e integridad de la información de los usuarios.

### Posibles mitigaciones

Para mitigar esta vulnerabilidad, se recomienda:

- Habilitar HTTPS en la página de login y en toda la aplicación web.
- Implementar un mecanismo de autenticación seguro, como OAuth2 o OpenID Connect.
- Utilizar un mecanismo de autenticación multifactor (MFA) para proteger las cuentas de los usuarios.
- Validar y sanitizar las entradas de los usuarios antes de procesarlas en la aplicación web.
- Implementar un mecanismo de bloqueo de cuentas después de varios intentos fallidos de autenticación.

### Referencias

- [OWASP: Authentication Cheat Sheet](https://owasp.org/www-community/cheat-sheets/Authentication_Cheat_Sheet)
- [OWASP: Top 10 2017 - A2:2017-Broken Authentication](https://owasp.org/www-project-top-ten/2017/A2_2017-Broken_Authentication)
- [CWE-287: Improper Authentication](https://cwe.mitre.org/data/definitions/287.html)