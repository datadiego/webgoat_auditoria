## Indice

- [Introducción](0_introduccion.md)
- [Metodología](1_metodologia.md)

## Introducción

Este informe de auditoría ha sido realizado durante el bootcamp de ciberseguridad 2024 en Keepcoding. El objetivo de la auditoría es identificar y analizar las vulnerabilidades de seguridad presentes en la aplicación web de OWASP WebGoat.

## Ambito de la auditoría

La auditoría de seguridad se ha centrado en la identificación de vulnerabilidades en la aplicación web de OWASP WebGoat. La aplicación web ha sido desplegada en un contenedor Docker y se ha accedido a ella a través de un navegador web.

## Metodología

La auditoría de seguridad se ha realizado siguiendo una metodología de pruebas de penetración. Se han utilizado herramientas de análisis como `nmap`, `whatweb`, `Nikto` y `dirbuster`, así como técnicas de fuzzing en las solicitudes HTTP, analisis de respuestas y captura de tráfico con `Burp Suite` y `Wireshark`.

## Alcance de la auditoría

La auditoría de seguridad se ha centrado en la identificación de vulnerabilidades en las siguientes categorías:

- A01:2021 - Broken Access Control - IDOR
- A03:2021 - Injection - SQL Injection
- A05:2021 - Security Misconfiguration - XXE
- A06:2021 - Outdated Components
- A07:2021 - Identification and Authentication Failures - Insecure Login
- A07:2021 - Identification and Authentication Failures - Weak Password Policy
