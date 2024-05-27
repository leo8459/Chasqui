##Chasqui Express Bo
Chasqui Express Bo es una aplicación de entrega rápida que facilita el envío de paquetes de un lugar a otro de forma eficiente.

##Requisitos previos
Antes de comenzar, asegúrate de tener instalados los siguientes programas:

Node.js: Versión mínima 16
Visual Studio Code: Cualquier versión
Android Studio: Versión mínima 20

##Instalación
Descarga el programa en formato ZIP proporcionado.
Extrae el archivo ZIP y guarda el proyecto en cualquier carpeta de tu elección.
Abre la carpeta seleccionada desde Visual Studio Code.
Descarga el proyecto de Android en formato ZIP .
Extrae el archivo ZIP y guarda el proyecto en cualquier carpeta de tu elección.
Abre la carpeta seleccionada desde Android Studio. Se instalarán los complementos necesarios.

##Cambios de IP y Puertos
En Visual Studio Code
Abre el archivo server.js.
Para cambiar el puerto, ve a la línea 34: const port = process.env.PORT || 6969; y modifica el puerto según sea necesario.
En la línea 59, cambia la dirección IP y el puerto según corresponda: server.listen(6969, '10.10.100.227' || 'localhost', function().
En Android Studio
Abre el archivo ApiRoutes ubicado en app > kotlin+java > com.empresa.kotlindelivery > api.
Modifica la URL de la API en la línea 6: val API_URL = "http://10.10.100.227:6969/api/". Asegúrate de que la IP y el puerto coincidan con los configurados en Visual Studio Code.

##Información de Contacto
Teléfono: 78877682
Nombre: Leonardo Doria Medina Ochoa