## Insecure Direct Object References

### Descripción de la vulnerabilidad

Los clientes pueden acceder a objetos y datos directamente por medio de solicitudes HTTP sin verificar los permisos necesarios. Esto permite que los clientes puedan acceder y modificar datos restringidos.

Un atacante podría acceder a información confidencial de otros usuarios, modificar datos sensibles, o realizar operaciones no autorizadas, compromentiendo la seguridad del sistema y la seguridad de sus usuarios.

### 3. Hallazgos

#### 3.1 Exposición de datos sensibles en la solicitud HTTP

Se identificó que en la respuesta a solicitudes GET en `/WebGoat/IDOR/profile` y `/WebGoat/IDOR/profile/{userId}` contienen datos sensibles del usuario en el cuerpo de la respuesta. 

##### Análisis de Riesgo

*Severidad:* Alta

*Impacto:* El atacante puede saltarse los principios de confidencialidad e integridad de la aplicación.

*Probabilidad:* Las posibilidades de explotación son críticas, se puede ejecutar la vulnerabilidad desde cualquier navegador analizando las respuestas HTTP en bruto.

TODO: Añadir evidencias

##### Acciones correctivas

- No exponer datos sensibles en las respuestas HTTP.
- No exponer información sensible en la URL.
- Implementar un control de acceso adecuado para proteger los datos sensibles.

https://owasp.org/Top10/A01_2021-Broken_Access_Control/
https://cheatsheetseries.owasp.org/cheatsheets/Insecure_Direct_Object_Reference_Prevention_Cheat_Sheet.html

#### 3.2 Acceso directo a objetos

Se identificó que la url `/WebGoat/IDOR/profile/{userId}` permite el acceso directo a los perfiles de otros usuarios.

Por ejemplo, la url `WebGoat/IDOR/profile/2342388` devuelve el perfil de otro usuario

##### Análisis de riesgo

*Severidad:* Alta

*Impacto*: El atacante puede romper el principio de confidencialidad accediendo a datos de otros usuarios sin autorización.

*Probabilidad:* Las posibilidades de explotación son críticas, la vulnerabilidad se puede explotar directamente desde el propio navegador.

TODO: Añadir evidencias
TODO: Añadir acciones correctivas y recomendaciones

##### Acciones correctivas

- Implementar un control de acceso adecuado para proteger los datos sensibles.
- No exponer información sensible en la URL.
- Implementar un control de acceso adecuado para proteger los datos sensibles.
- No exponer datos sensibles en las respuestas HTTP.

https://owasp.org/Top10/A01_2021-Broken_Access_Control/
https://cheatsheetseries.owasp.org/cheatsheets/Insecure_Direct_Object_Reference_Prevention_Cheat_Sheet.html

#### 3.3 Modificación no autorizada de perfiles

Se identificó que la url `/WebGoat/IDOR/profile/{userId}` permite la edición del objeto sin autorización mediante el uso del metodo `PUT`.

Por ejemplo, la siguiente petición es válida, editando el usuario 2342388:

```HTTP
PUT /WebGoat/IDOR/profile/2342388 HTTP/1.1
Host: localhost:8080
sec-ch-ua: "Not/A)Brand";v="8", "Chromium";v="126"
Accept-Language: es-ES
sec-ch-ua-mobile: ?0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.6478.57 Safari/537.36
Content-Type: application/json; charset=UTF-8
Accept: */*
X-Requested-With: XMLHttpRequest
sec-ch-ua-platform: "Linux"
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: cors
Sec-Fetch-Dest: empty
Referer: http://localhost:8080/WebGoat/start.mvc?username=datadiego
Accept-Encoding: gzip, deflate, br
Cookie: JSESSIONID=tTmZz8bgHom9YLQFKoMS0RfTKEK1YdTtFVtdwHMw
Connection: keep-alive
Content-Length: 104

{
  "size":"large",
  "name":"Buffalo Bill",
  "userId":"2342388",
  "role": "1",
  "color": "red"
}
```

##### Análisis de riesgo

*Severidad:* Alta
*Impacto*: El atacante puede romper el principio de integridad modificando datos de otros usuarios sin autorización, comprometiendo la seguridad de la aplicación.
*Probabilidad:* Las posibilidades de explotación son críticas, usando cualquier proxy o herramienta de desarrollo web.

TODO: Añadir evidencias

##### Acciones correctivas

- Implementar un control de acceso adecuado para proteger los datos sensibles.
- No exponer información sensible en la URL.

https://owasp.org/Top10/A01_2021-Broken_Access_Control/
https://cheatsheetseries.owasp.org/cheatsheets/Insecure_Direct_Object_Reference_Prevention_Cheat_Sheet.html