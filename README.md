# tp2_flutter_grupo12
Archivo: jugadores_details.dart
Este archivo contiene la pantalla o widget que muestra los detalles de un jugador específico.
Resumen de funcionalidades:
Widget principal:
JugadoresDetails es un widget de tipo StatelessWidget que recibe datos de un jugador como argumentos para renderizarlos.
Datos mostrados:
Información del jugador (detalles específicos que dependerán del modelo).
Diseño:
Utiliza widgets como Column y Text para estructurar y mostrar la información.
Uso esperado:
Se utiliza para presentar los detalles completos de un jugador seleccionado desde una lista.


Archivo: jugadores_list_screen.dart
Este archivo gestiona la pantalla que muestra una lista de jugadores.
Resumen de funcionalidades:
Widget principal:
JugadoresListScreen es un widget que representa la vista principal con una lista interactiva de jugadores.
Interactividad:
Cada jugador en la lista permite al usuario hacer clic para ver más detalles, redirigiendo al widget JugadoresDetails.
Diseño:
Utiliza widgets como ListView o similares para renderizar la lista en forma desplazable.
Manejo de datos:
Puede recibir una lista de objetos para renderizar cada elemento de la lista.
Uso esperado:
Es la pantalla inicial o principal para explorar y seleccionar jugadores.

Relación entre los archivos
Flujo de navegación:
Desde JugadoresListScreen, el usuario selecciona un jugador.
Navega a JugadoresDetails para ver información detallada del jugador.
Modularidad:
Ambos archivos están claramente separados para manejar de forma independiente la lógica de lista y la de detalles.


## Pantalla Principal: `HomeScreen`

La pantalla principal **HomeScreen** es el punto de inicio de la aplicación, ofreciendo acceso a varias funcionalidades principales:

### Función Principal
Permite a los usuarios navegar fácilmente a diferentes secciones como:
- **Perfil personal**: Accede a la personalización del perfil.
- **Películas, jugadores de fútbol y usuarios**: Explora listas relacionadas con estas categorías.

### Algunos de los Widgets Utilizados y sus funciones:

1. **`DrawerMenu`**: Permite abrir un menú lateral con opciones adicionales.

2. **`Card`**: Encapsula y organiza elementos en tarjetas, como el perfil o las opciones de navegación.

3. **`ListTile`**: Proporciona una lista interactiva con rutas como:
     - Películas.
     - Jugadores de fútbol.
     - Usuarios.
      Genera efectos táctiles para una mejor experiencia de usuario.

## Pantalla Principal de Peliculas: `BalotMoviesScreen`
La pantalla **BalotListScreen** es una interfaz interactiva que muestra una lista de películas destacadas. Ofrece funcionalidades clave como:

- Búsqueda dinámica: Permite filtrar películas por su título de manera instantánea.
- Cambio de vista: Alterna entre un diseño en lista o en cuadrícula según la preferencia del usuario.
- Modo oscuro/claro: Adapta los colores de la interfaz al tema seleccionado.
- Navegación a detalles: Permite acceder a una pantalla con información detallada de cada película.

### Algunos de los Widgets utilizados y sus funciones:
**`Scaffold`**: Proporciona la estructura básica de la pantalla, incluyendo la barra de herramientas, el cuerpo y otros elementos visuales.

**`AppBar`**: Representa la barra superior, que incluye el título de la pantalla y opciones como el cambio de tema.

**`TextField`**: Campo de entrada para que el usuario realice búsquedas de películas.

**`GridView / ListView`**: Muestra las películas en formato de cuadrícula o lista, según la preferencia del usuario.

**`IconButton`**: Botones interactivos para alternar vistas (lista/cuadrícula) y activar el modo oscuro/claro.

**`ListTile`**: Se usa en la vista de lista para mostrar información clave de cada película de forma ordenada.

## Pantalla de Detalles de Película: `MovieDetailsScreen`

La pantalla **MovieDetailsScreen** permite a los usuarios visualizar información detallada sobre una película, como su título, sinopsis, calificación, género, y una imagen que puede ampliarse.

### Funcionalidades Principales
1. **Visualización de detalles**:
   - Muestra el título, género, sinopsis y calificación promedio de la película seleccionada.
   - Incluye una imagen de la pelicula.

2. **Ampliación de imagen**:
   - Los usuarios pueden pulsar sobre el poster de la película para verlo en una pantalla completa.

3. **Modo claro/oscuro**:
   - La pantalla ajusta los colores automáticamente según el tema seleccionado en la aplicación (claro/oscuro).

4. **Navegación**:
   - Incluye un botón para regresar a la lista de películas.

