import 'package:flutter/material.dart';
import 'package:tp2_flutter_grupo12/mocks/jugadores_mock.dart' show jugadores;
import 'package:tp2_flutter_grupo12/helpers/preferences.dart';

class JugadoresListScreen extends StatefulWidget {
  const JugadoresListScreen({super.key});

  @override
  State<JugadoresListScreen> createState() => _JugadoresListScreenState();
}

class _JugadoresListScreenState extends State<JugadoresListScreen> {
  List _filteredPlayers = [];
  String _searchQuery = '';
  bool _searchActive = false;
  bool _isGridView = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _filteredPlayers = jugadores;
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
        _filteredPlayers = jugadores;
      } else {
        _filteredPlayers = jugadores.where((player) {
          return player['name']
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Preferences.darkmode;
    final Color backgroundColor =
        isDarkMode ? const Color.fromARGB(255, 35, 35, 35) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    final Color cardColor =
        isDarkMode ? const Color.fromARGB(255, 52, 58, 64) : Colors.grey[200]!;

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            _buildHeader(textColor),
            searchArea(isDarkMode, cardColor),
            _buildViewToggle(textColor),
            _isGridView ? _buildGridView(cardColor) : listItemsArea(cardColor),
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
            'Lista de Jugadores',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 1.1,
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

  Widget _buildGridView(Color cardColor) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.62,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _filteredPlayers.length,
        itemBuilder: (context, index) {
          final player = _filteredPlayers[index];
          String playerName = player['name'] ?? 'Sin nombre';
          String playerAvatar = player['image'] ?? '';

          return GestureDetector(
            onTap: () => _navigateToDetails(player),
            child: Card(
              color: cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              shadowColor: Colors.black.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 6,
                    child: _buildPlayerImage(playerAvatar),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            playerName,
                            style: TextStyle(
                              color: Preferences.darkmode
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            player['team'] ?? 'Equipo Desconocido',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
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

  Widget _buildPlayerImage(String playerImage) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: playerImage.isNotEmpty
          ? Image.asset(
              playerImage,
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
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
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
                            color:
                                isDarkMode ? Colors.white70 : Colors.black54),
                        filled: true,
                        fillColor: cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _searchController.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                      _updateSearch('');
                    },
                    icon: Icon(Icons.clear,
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchActive = false;
                      });
                    },
                    icon: Icon(Icons.arrow_back,
                        color: isDarkMode ? Colors.white : Colors.black),
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
                    icon: Icon(Icons.keyboard_arrow_left_outlined,
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchActive = !_searchActive;
                      });
                      _focusNode.requestFocus();
                    },
                    icon: Icon(Icons.search,
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
    );
  }

  Widget listItemsArea(Color cardColor) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _filteredPlayers.length,
        itemBuilder: (BuildContext context, int index) {
          final jugadores = _filteredPlayers[index];
          String playerName = jugadores['name'] ?? 'Sin nombre';
          String playerAvatar = jugadores['image'] ?? '';

          return GestureDetector(
            onTap: () => _navigateToDetails(jugadores),
            child: Container(
              height: 120,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (playerAvatar.isNotEmpty)
                    Image.asset(
                      playerAvatar,
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
                    ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          playerName,
                          style: TextStyle(
                            color: Preferences.darkmode
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          jugadores['team'] ?? 'Equipo Desconocido',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToDetails(Map<String, dynamic> jugadores) {
    Navigator.pushNamed(
      context,
      'jugador_details',
      arguments: <String, dynamic>{
        'id': jugadores['id'] ?? '',
        'image': jugadores['image'] ?? '',
        'name': jugadores['name'] ?? 'Desconocida',
        'team': jugadores['team'] ?? ' sin equipo',
        'country': jugadores['country'] ?? "Sin país",
        'description': jugadores['description'] ?? "Sin descripción",
      },
    );
  }
}
