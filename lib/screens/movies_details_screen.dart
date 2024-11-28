import 'package:flutter/material.dart';
import '../themes/balot_movies_colors.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;

  const FullScreenImageViewer({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark 
        ? Colors.black 
        : Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark 
          ? Colors.black 
          : Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark 
            ? Colors.white 
            : Colors.black,
        ),
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
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isDarkMode
                  ? [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                    ]
                  : [
                      Colors.white,
                      Colors.grey.shade200,
                    ],
              ),
            ),
          ),
          
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Poster Section
                if (movie['poster_path']?.isNotEmpty ?? false)
                  Stack(
                    children: [
                      Hero(
                        tag: 'movieImage${movie['poster_path']}',
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: Image.asset(
                            movie['poster_path']!,
                            width: double.infinity,
                            height: 500,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: 500,
                                color: isDarkMode ? Colors.grey[900] : Colors.grey[300],
                                child: Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 100,
                                    color: isDarkMode ? Colors.white30 : Colors.black26,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: GestureDetector(
                          onTap: () => _showFullScreenImage(context, movie['poster_path']!),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.zoom_in, 
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                // Movie Details Section
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              movie['title'] ?? 'Sin título',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: BalotMoviesColors.yellow,
                                size: 28,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${movie['vote_average']?.toStringAsFixed(1) ?? "N/A"} / 10',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: isDarkMode ? Colors.white70 : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Genre Text
                      Text(
                        movie['genre'] ?? "Desconocido",
                        style: TextStyle(
                          color: BalotMoviesColors.redPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Description
                      Text(
                        'Sinopsis',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        movie['overview'] ?? 'No hay descripción disponible.',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.white70 : Colors.black87,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),

                      const SizedBox(height: 30),

                      // Back Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text(
                            'Volver a la Lista de Películas',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BalotMoviesColors.redPrimary,
                            foregroundColor: BalotMoviesColors.textLight,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}