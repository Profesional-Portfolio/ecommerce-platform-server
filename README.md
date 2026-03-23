# E-commerce Platform Microservices

Sistema completo de microservicios desarrollado con **NestJS** y **TypeScript**, diseñado para escalabilidad, mantenibilidad y comunicación eficiente mediante colas de mensajes.

## 🏗️ Arquitectura del Sistema

La plataforma se compone de los siguientes microservicios:

-   🌐 **API Gateway**: Punto de entrada único para todos los clientes. Maneja autenticación (JWT) y enrutamiento.
-   👤 **User Service**: Gestión de perfiles de usuario y autenticación con PostgreSQL.
-   📦 **Product Service**: Catálogo de productos y gestión de inventario con MongoDB.
-   🔔 **Notification Service**: Notificaciones en tiempo real vía WebSockets y Redis.
-   🛒 **Shopping Cart Service**: Gestión de carritos de compra persistentes.
-   📋 **Orders Service**: Procesamiento y seguimiento de pedidos con PostgreSQL (Prisma).
-   💳 **Payments Service**: Integración con Stripe para procesamiento de pagos.

## 🚀 Inicio Rápido

### Prerrequisitos

-   **Docker** y **Docker Compose**
-   **Node.js 22+**
-   **pnpm** (recomendado para gestión de paquetes)

### Instalación y Ejecución

1.  **Clonar con submódulos**:
    ```bash
    git clone --recursive https://github.com/Profesional-Portfolio/ecommerce-platform-server.git
    cd ecommerce-platform-server
    ```
2.  **Configurar entorno**:
    ```bash
    cp env.example .env
    # Asegúrate de revisar y ajustar los valores en .env
    ```
3.  **Levantar servicios**:
    ```bash
    make up
    ```

## 🛠️ Gestión de Submódulos

Este proyecto utiliza Git Submodules para gestionar cada microservicio de forma independiente.

### Comandos útiles de Git

-   **Actualizar todos los submódulos**:
    ```bash
    git submodule update --remote --merge
    ```
-   **Sincronizar cambios locales**: Si has actualizado `.gitmodules` recientemente:
    ```bash
    git submodule sync
    ```

Para más detalles sobre el flujo de trabajo con submódulos y nuevas funcionalidades, consulta [FEATURE_WORKFLOW.md](./brain/83610013-88af-4072-b053-46d19fcfbc63/FEATURE_WORKFLOW.md).

## 📜 Scripts de Automatización (Makefile)

Hemos incluido un `Makefile` para simplificar las tareas comunes:

-   `make help`: Muestra los comandos disponibles.
-   `make install`: Instala dependencias en todos los microservicios.
-   `make up`: Inicia todos los servicios con Docker Compose.
-   `make down`: Detiene y elimina los contenedores.
-   `make logs`: Muestra logs en tiempo real.
-   `make test`: Ejecuta la suite de pruebas completa.

## 🧪 Pruebas

Puedes ejecutar pruebas de integración rápidas usando el script:
```bash
./scripts/quick-test.sh
```
Para una guía detallada de endpoints, consulta [test-endpoints.md](test-endpoints.md).

## 📄 Documentación por Servicio

Cada microservicio tiene su propio `README.md` con detalles específicos:
-   [API Gateway](./ecommerce-api-gateway/README.md)
-   [User Service](./ecommerce-users-service/README.md)
-   [Product Service](./ecommerce-products-service/README.md)
-   [Notification Service](./ecommerce-notifications-service/README.md)
-   [Shopping Cart Service](./ecommerce-shopping-cart-service/README.md)
-   [Orders Service](./ecommerce-orders-service/README.md)
-   [Payments Service](./ecommerce-payments-service/README.md)
