import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp2_flutter_grupo12/screens/usuarios_details_screen.dart';
import 'package:tp2_flutter_grupo12/service/usuarios_favorites.dart';
import 'package:tp2_flutter_grupo12/widgets/usuarios_card.dart';
import 'package:tp2_flutter_grupo12/widgets/usuarios_search_bar.dart';
import 'package:tp2_flutter_grupo12/mocks/usuarios_mock.dart' show elements; // Importar el nuevo archivo

class UsuariosListScreen extends StatefulWidget {
  const UsuariosListScreen({super.key});

  @override
  State<UsuariosListScreen> createState() => _UsuariosListScreenState();
}

class _UsuariosListScreenState extends State<UsuariosListScreen> {
  List _auxiliarElements = [];
  String _searchQuery = '';
  bool _searchActive = false;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _auxiliarElements = List.from(elements.map((element) => List.from(element))); // Crear copia de los elementos
    _loadFavorites(); // Cargar favoritos
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Cargar los favoritos
  void _loadFavorites() async {
    for (var element in _auxiliarElements) {
      bool isFavorite = await FavoritesManager.loadFavorite(element[0].toString());
      setState(() {
        element[7] = isFavorite; // Cambiar el estado de favorito
      });
    }
  }

  // Actualizar la búsqueda de los usuarios
  void _updateSearch(String? query) {
    setState(() {
      _searchQuery = query ?? '';
      if (_searchQuery.isEmpty) {
        _auxiliarElements = List.from(elements.map((element) => List.from(element))); // Restablecer a los originales
      } else {
        _auxiliarElements = elements.where((element) {
          final fullName = '${element[2]} ${element[3]}'.toLowerCase();
          return fullName.contains(_searchQuery.toLowerCase());
        }).map((element) => List.from(element)).toList();  // Crear copias mutables para cada resultado
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Column(
          children: [
            UsuariosSearchBar(
              isActive: _searchActive,
              searchController: _searchController,
              focusNode: _focusNode,
              onClose: () {
                _searchController.clear();
                FocusManager.instance.primaryFocus?.unfocus();
                _updateSearch('');
              },
              onBack: () {
                setState(() {
                  _searchActive = !_searchActive;
                });
              },
              onSearch: (value) => _updateSearch(value),
            ),
            listItemsArea(),
          ],
        ),
      ),
    );
  }

  // Lista de elementos de usuario
  Expanded listItemsArea() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _auxiliarElements.length,
        itemBuilder: (BuildContext context, int index) {
          final element = _auxiliarElements[index];

          return UsuariosCard(
            avatar: element[1],
            firstName: element[2],
            lastName: element[3],
            gender: element[5],
            country: element[6],
            isFavorite: element[7],
            onFavoriteTap: () async {
              setState(() {
                element[7] = !element[7];
              });
              await FavoritesManager.saveFavorite(element[0].toString(), element[7]); // Guardar favorito en SharedPreferences
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsuarioDetailScreen(
                    usuario: {
                      'id': element[0],
                      'avatar': element[1],
                      'firstName': element[2],
                      'lastName': element[3],
                      'email': element[4],
                      'gender': element[5],
                      'country': element[6],
                      'isFavorite': element[7],
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
