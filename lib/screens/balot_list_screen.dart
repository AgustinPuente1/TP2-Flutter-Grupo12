import 'package:flutter/material.dart';
import 'package:tp2_flutter_grupo12/mocks/movies_mock.dart' show movies;
import 'package:tp2_flutter_grupo12/helpers/preferences.dart';

class BalotListScreen extends StatefulWidget {
  const BalotListScreen({super.key});

  @override
  State<BalotListScreen> createState() => _BalotListScreenState();
}

class _BalotListScreenState extends State<BalotListScreen> {
  List _filteredMovies = [];
  String _searchQuery = '';
  bool _searchActive = false;
  bool _isGridView = false;
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
        _filteredMovies = movies;
      } else {
        _filteredMovies = movies.where((movie) {
          return movie['title']
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Preferences.darkmode;
    final Color backgroundColor = isDarkMode ? const Color.fromARGB(255, 35, 35, 35) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    final Color cardColor = isDarkMode ? const Color.fromARGB(255, 52, 58, 64) : Colors.grey[200]!;
    final Color starColor = isDarkMode ? const Color.fromARGB(255, 255, 217, 0) : const Color.fromARGB(255, 255, 204, 0);

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            _buildHeader(textColor),
            searchArea(isDarkMode, cardColor),
            _buildViewToggle(textColor),
            _isGridView 
                ? _buildGridView(starColor, cardColor)
                : listItemsArea(starColor, cardColor),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mejores Películas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewToggle(Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list : Icons.grid_view,
              color: textColor,
            ),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(Color starColor, Color cardColor) {
  return Expanded(
    child: GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.62, // Aumentado ligeramente para dar más espacio vertical
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = _filteredMovies[index];
        String movieTitle = movie['title'] ?? 'Sin título';
        String movieImage = movie['image'] ?? '';

        return GestureDetector(
          onTap: () => _navigateToDetails(movie),
          child: Card(
            color: cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Imagen de la película
                Expanded(
                  flex: 6, // Reducido ligeramente para dar más espacio al contenido
                  child: _buildMovieImage(movieImage),
                ),
                // Contenido (título, género, calificación)
                Expanded(
                  flex: 4, // Aumentado para dar más espacio al contenido
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título con altura dinámica
                        Expanded(
                          flex: 3,
                          child: Text(
                            movieTitle,
                            style: TextStyle(
                              color: Preferences.darkmode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13, // Tamaño de fuente reducido
                            ),
                            maxLines: 3, // Aumentado a 3 líneas
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
              
                        // Genero
                        Expanded(
                          flex: 1,
                          child: Text(
                            movie['genre'] ?? 'Género Desconocido',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        
                        // Calificación
                        Row(
                          children: [
                            Icon(Icons.star, color: starColor, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              (movie['rating']?.toStringAsFixed(1)) ?? '0.0',
                              style: TextStyle(
                                color: Preferences.darkmode ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
  Widget _buildMovieImage(String movieImage) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
      child: movieImage.isNotEmpty
          ? Image.asset(
              movieImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
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
    );
  }

  Widget searchArea(bool isDarkMode, Color cardColor) {
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
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        hintStyle: TextStyle(
                          color: isDarkMode ? Colors.white70 : Colors.black54
                        ),
                        filled: true,
                        fillColor: cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _searchController.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                      _updateSearch('');
                    },
                    icon: Icon(Icons.clear, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchActive = false;
                      });
                    },
                    icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
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
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined, 
                      color: isDarkMode ? Colors.white : Colors.black
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchActive = !_searchActive;
                      });
                      _focusNode.requestFocus();
                    },
                    icon: Icon(
                      Icons.search, 
                      color: isDarkMode ? Colors.white : Colors.black
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget listItemsArea(Color starColor, Color cardColor) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _filteredMovies.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = _filteredMovies[index];
          String movieTitle = movie['title'] ?? 'Sin título';
          String movieImage = movie['image'] ?? '';

          return GestureDetector(
            onTap: () => _navigateToDetails(movie),
            child: Container(
              height: 120,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cardColor,
              ),
              child: Row(
                children: [
                  if (movieImage.isNotEmpty)
                    Image.asset(
                      movieImage,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
                    )
                  else
                    const Icon(
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
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Preferences.darkmode ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          movie['genre'] ?? 'Género Desconocido',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: starColor,
                        size: 20,
                      ),
                      Text(
                        (movie['rating']?.toStringAsFixed(1)) ?? '0.0',
                        style: TextStyle(
                          color: Preferences.darkmode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToDetails(Map<String, dynamic> movie) {
    Navigator.pushNamed(
      context,
      'movie_details',
      arguments: <String, dynamic>{
        'title': movie['title'] ?? 'Sin título',
        'overview': movie['description'] ?? 'Sin descripción',
        'release_date': movie['release_date'] ?? 'Desconocida',
        'poster_path': movie['image'] ?? '',
        'vote_average': movie['rating'] ?? 0.0,
        'genre': movie['genre'] ?? 'Desconocido',
      },
    );
    FocusManager.instance.primaryFocus?.unfocus();
  }
}