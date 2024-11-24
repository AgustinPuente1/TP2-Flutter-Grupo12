import 'package:flutter/material.dart';
import '../themes/balot_movies_colors.dart';  // Importa los colores específicos


class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BalotMoviesColors.redPrimary,
        title: Text(
          movie['title'] ?? 'Detalles de la película',
          style: TextStyle(color: BalotMoviesColors.textLight),
        ),
        iconTheme: const IconThemeData(color: BalotMoviesColors.textLight),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie['poster_path']?.isNotEmpty ?? false)
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  movie['poster_path']!,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: BalotMoviesColors.getTextColor(context),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Imagen no disponible',
                            style: TextStyle(
                              color: BalotMoviesColors.getTextColor(context),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 16),
            
            Text(
              movie['title'] ?? 'Sin título',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: BalotMoviesColors.getTextColor(context),
              ),
            ),
            const SizedBox(height: 8),
            
            Text(
              'Género: ${movie['genre'] ?? "Desconocido"}',
              style: TextStyle(
                fontSize: 18,
                color: BalotMoviesColors.redPrimary,
              ),
            ),
            const SizedBox(height: 12),
            
            Text(
              'Descripción:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: BalotMoviesColors.getTextColor(context),
              ),
            ),
            const SizedBox(height: 8),
            
            Text(
              movie['overview'] ?? 'No hay descripción disponible.',
              style: TextStyle(
                fontSize: 16,
                color: BalotMoviesColors.getTextColor(context),
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: BalotMoviesColors.yellow,
                  size: 24,
                ),
                const SizedBox(width: 4),
                Text(
                  '${movie['vote_average']?.toStringAsFixed(1) ?? "N/A"} / 10',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: BalotMoviesColors.getTextColor(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: BalotMoviesColors.redPrimary,
                  foregroundColor: BalotMoviesColors.textLight,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Volver a la Lista de Películas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}