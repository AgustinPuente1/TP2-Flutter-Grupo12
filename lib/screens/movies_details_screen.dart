import 'package:flutter/material.dart';
import '../themes/balot_movies_colors.dart';

// Widget para mostrar la imagen en pantalla completa
class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;

  const FullScreenImageViewer({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 4.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  void _showFullScreenImage(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageViewer(imagePath: imagePath),
      ),
    );
  }

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
              GestureDetector(
                onTap: () => _showFullScreenImage(context, movie['poster_path']!),
                child: Hero(
                  tag: 'movieImage${movie['poster_path']}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
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
                        // Indicador visual de que la imagen es interactiva
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.zoom_in,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
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