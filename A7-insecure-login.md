## Desarrollo

El botón de login manda una peticion sin cifrar al servidor, por lo que podemos interceptarla y ver la contraseña en texto plano.

## Solución

Para interceptar la petición, podemos utilizar herramientas como WireShark o Burp Suite.

```plaintext
{
    "username": "CaptainJack",
    "password": "BlackPearl"
}
```

TODO: Añadir foto de wireshark y burp suite