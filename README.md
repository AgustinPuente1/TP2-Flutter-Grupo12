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
