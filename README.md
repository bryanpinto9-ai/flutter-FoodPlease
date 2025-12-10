# FoodPlease+ – Prototipo Móvil en Flutter

Este repositorio contiene el prototipo móvil híbrido (iOS/Android) de la aplicación FoodPlease+, desarrollado en Flutter. El objetivo es representar la navegación, diseño visual y la estructura base de la aplicación móvil, sin lógica conectada a un backend. Este prototipo forma parte del proyecto académico de integración móvil y web.

## Instalación y Ejecución del Prototipo

Para ejecutar el proyecto Flutter en un entorno local, siga los siguientes pasos:

1. Clonar este repositorio:
   git clone https://github.com/bryanpinto9-ai/flutter-FoodPlease.git
   cd flutter-FoodPlease

2. Instalar dependencias del proyecto:
   flutter pub get

3. Ejecutar la aplicación:
   flutter run

El prototipo puede ejecutarse en un emulador Android, simulador iOS, dispositivo físico o mediante navegador web si Flutter Web está habilitado.

## Descripción del Prototipo

Este prototipo corresponde a una versión simplificada de la aplicación FoodPlease+, desarrollada con énfasis en:
- Navegación entre pantallas
- Estructura visual y diseño base
- Flujo general del usuario
- Separación de roles: Cliente, Administrador y Repartidor

El prototipo no incluye backend, lógica real de autenticación ni persistencia de datos, ya que su finalidad es presentar la estructura principal y simular las interacciones.

## Usuarios de Prueba (Simulados)

Para simular el comportamiento de los distintos roles del sistema, se utilizan las siguientes credenciales ficticias:

Administrador (Dueño del Local)
- Correo: owner@test.com
- Contraseña: test123

Repartidor (Delivery)
- Correo: delivery@test.com
- Contraseña: test123

Cliente
- Correo: cliente@test.com
- Contraseña: test123

## Uso del Prototipo

Cliente:
El usuario cliente puede navegar entre las siguientes pantallas:
- Catálogo de productos
- Detalle de producto
- Carrito de compras (simulado)
- Confirmación de pedido
- Estado del pedido (pedido recibido, preparación, en camino y entregado)

Administrador:
El administrador cuenta con acceso a las vistas de administración:
- Dashboard del local
- Listado de productos
- Crear producto
- Editar producto
- Eliminar producto
- Visualización de pedidos

Repartidor:
El repartidor puede:
- Visualizar pedidos asignados
- Revisar detalles del pedido
- Actualizar el estado del pedido (por ejemplo, en camino o entregado)

## Despliegue en Cloud

El proyecto está desplegado en la nube mediante un repositorio público en GitHub. Esto permite:
- Acceso remoto al código fuente
- Control de versiones
- Ejecución del prototipo en cualquier sistema que cuente con Flutter

Repositorio del proyecto:
https://github.com/bryanpinto9-ai/flutter-FoodPlease

## Estructura del Proyecto

Este proyecto incluye las carpetas propias de una aplicación Flutter:

flutter-FoodPlease/
- android/        Archivos nativos Android
- ios/            Archivos nativos iOS
- lib/            Pantallas, vistas y navegación del prototipo
- web/            Versión web generada por Flutter
- test/           Archivos de pruebas
- pubspec.yaml    Configuración del proyecto y dependencias
- README.md       Documentación del repositorio

## Tecnologías Utilizadas

- Flutter 3.x
- Dart
- Widgets de interfaz Material
- Navegación mediante MaterialPageRoute
- Compatibilidad con Android, iOS y Web

## Estado del Proyecto

Este repositorio representa un prototipo navegable cuyo objetivo es mostrar la estructura base de la aplicación FoodPlease+. La integración de base de datos, backend, autenticación real y procesos avanzados se encuentra planificada como trabajo futuro.

## Autor

Proyecto desarrollado por Bryan Pinto como parte de una evaluación académica orientada al desarrollo web y móvil.
