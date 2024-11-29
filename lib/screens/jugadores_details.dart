import 'package:flutter/material.dart';
import 'package:tp2_flutter_grupo12/helpers/preferences.dart';

class JugadoresDetailsScreen extends StatelessWidget {
  const JugadoresDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener los argumentos enviados desde la pantalla anterior
    final Map<String, dynamic> jugador =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final bool isDarkMode = Preferences.darkmode;
    final Color backgroundColor =
        isDarkMode ? const Color.fromARGB(255, 35, 35, 35) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          jugador['name'] ?? 'Detalles del Jugador',
          style: TextStyle(color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen del jugador con fondo redondeado
            Hero(
              tag: jugador['id'], // Animación de transición
              child: Container(
                width: 150, // Ancho de la imagen
                height: 150, // Alto de la imagen
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Hacemos la caja circular
                  color: isDarkMode
                      ? Colors.grey[800]
                      : Colors.grey[200], // Color de fondo
                ),
                child: ClipOval(
                  child: Image.asset(
                    jugador['image'], // Carga de imagen desde la carpeta
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Detalles en una tarjeta estilizada
            _buildDetailCard(
              jugador['name'] ?? 'Desconocido',
              jugador['team'] ?? 'Sin equipo',
              jugador['country'] ?? 'Sin país',
              textColor,
            ),
            const SizedBox(height: 20),
            // Contenedor con la descripción del jugador
            _buildDescriptionContainer(
                context, jugador['description'] ?? 'Sin descripción disponible')
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(
      String name, String team, String country, Color textColor) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Nombre del jugador
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Línea separadora
            Divider(
              color: textColor.withOpacity(0.5),
              thickness: 1,
            ),
            const SizedBox(height: 16),
            // Equipo
            Row(
              children: [
                Icon(Icons.sports_soccer, color: textColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Equipo: $team',
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // País
            Row(
              children: [
                Icon(Icons.flag, color: textColor),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'País: $country',
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionContainer(BuildContext context, String description) {
    // El mismo color que utilizas para el contenedor de información del jugador
    Color descriptionContainerColor = Theme.of(context).brightness ==
            Brightness.dark
        ? const Color.fromARGB(800, 44, 43, 43) // Fondo oscuro en modo oscuro
        : const Color.fromARGB(255, 218, 215, 215); // Fondo claro en modo claro

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:
            descriptionContainerColor, // Usar el mismo color que el contenedor del jugador
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black38 // Sombra más suave en modo oscuro
                : Colors.black26, // Sombra más sutil en modo claro
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        description,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white70 // Color claro para texto en modo oscuro
              : Colors.black87, // Color oscuro para texto en modo claro
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
