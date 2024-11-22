import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tp2_flutter_grupo12/mocks/movies_mock.dart' show movies;
import 'dart:io';

class BalotListScreen extends StatefulWidget {
  const BalotListScreen({super.key});

  @override
  State<BalotListScreen> createState() => _BalotListScreenState();
}

class _BalotListScreenState extends State<BalotListScreen> {
  List _filteredMovies = [];
  String _searchQuery = '';
  bool _searchActive = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _filteredMovies = movies;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateSearch(String? query) {
    setState(() {
      _searchQuery = query ?? '';
      if (_searchQuery.isEmpty) {
        _filteredMovies = movies; // Restablece al estado original
      } else {
        _filteredMovies = movies.where((movie) {
          return movie['title']
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
        }).toList();
      }
    });
  }

  String _getImagePath(String movieTitle) {
    // Convierte el título en un nombre de archivo válido (sin espacios y en minúsculas)
    String formattedTitle = movieTitle.replaceAll(RegExp(r'\s+'), '_').toLowerCase();
    // Intenta cargar la imagen desde el directorio correspondiente
    String path = 'assets/images/$formattedTitle.jpg';

    // Aquí podrías verificar si el archivo existe, si necesitas, pero en Flutter generalmente
    // se maneja el error de imagen faltante con un `errorBuilder`, que ya tienes implementado.
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Column(
          children: [
            searchArea(),
            listItemsArea(),
          ],
        ),
      ),
    );
  }

  Expanded listItemsArea() {
  return Expanded(
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _filteredMovies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = _filteredMovies[index];
        String movieTitle = movie['title'] ?? 'Sin título';
        String movieImage = movie['image'] ?? '';  // Ruta de la imagen

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              'movie_details',
              arguments: <String, dynamic>{
                'title': movieTitle,
                'overview': movie['description'] ?? 'Sin descripción',
                'release_date': movie['release_date'] ?? 'Desconocida',
                'poster_path': movieImage,
                'vote_average': movie['rating'] ?? 0.0,
                'genre': movie['genre'] ?? 'Desconocido',
              },
            );
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(31, 206, 219, 246),
                  blurRadius: 0,
                  spreadRadius: 3,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                // Mostrar la imagen de la película usando la propiedad 'image'
                movieImage.isNotEmpty
                    ? Image.asset(
                        movieImage, 
                        width: 80, 
                        height: 80, 
                        fit: BoxFit.cover, // La imagen llena el espacio del cuadrante manteniendo su proporción
                        errorBuilder: (context, error, stackTrace) {
                          // Manejar casos de imagen faltante:
                          return const Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey,
                          );
                        },
                      )
                    : const Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieTitle,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(movie['genre'] ?? 'Género Desconocido'),
                    ],
                  ),
                ),
                Text((movie['rating']?.toStringAsFixed(1)) ?? '0.0'),
              ],
            ),
          ),
        );
      },
    ),
  );
}


  AnimatedSwitcher searchArea() {
    return AnimatedSwitcher(
      switchInCurve: Curves.bounceIn,
      switchOutCurve: Curves.bounceOut,
      duration: const Duration(milliseconds: 300),
      child: (_searchActive)
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      onChanged: (value) {
                        _updateSearch(value);
                      },
                      onFieldSubmitted: (value) {
                        _updateSearch(value);
                      },
                      decoration: const InputDecoration(hintText: 'Buscar...'),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _searchController.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                      _updateSearch('');
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchActive = false;
                      });
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_left_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchActive = !_searchActive;
                      });
                      _focusNode.requestFocus();
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
    );
  }
}
