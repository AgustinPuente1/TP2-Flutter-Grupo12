import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recibir los argumentos pasados desde la lista
    final Map<String, dynamic> movie = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              movie['poster_path'],  // Mostrar la imagen
              width: 200,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              movie['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Género: ${movie['genre']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Descripción: ${movie['overview']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Calificación: ${movie['vote_average']}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
