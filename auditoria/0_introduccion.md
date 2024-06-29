## Introducción

Este informe de auditoría ha sido realizado durante el bootcamp de ciberseguridad 2024 en Keepcoding. El objetivo de la auditoría es identificar y analizar las vulnerabilidades de seguridad presentes en la aplicación web de OWASP WebGoat.

Se pueden consultar las vulnerabilidades analizadas en el informe.

Se pueden consultar las resoluciones de los ejercicios de WebGoat en el [repositorio]() del proyecto.

## Metodología

La auditoría de seguridad se ha realizado siguiendo una metodología de pruebas de penetración. Se han utilizado herramientas de análisis como `nmap`, `whatweb`, `Nikto` y `dirbuster`, así como técnicas de fuzzing en las solicitudes HTTP, analisis de respuestas y captura de tráfico con `Burp Suite` y `Wireshark`. Otras técnicas utilizadas han sido la inyección de código SQL y XSS en los campos de texto de la aplicación web y el análisis del código fuente en el frontend, junto con la inspección de elementos en el navegador y solicitudes HTTP.


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
