import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp2_flutter_grupo12/models/usuarios_model.dart';
import 'package:tp2_flutter_grupo12/screens/usuarios_details_screen.dart';
import 'package:tp2_flutter_grupo12/service/usuarios_favorites_manager.dart';
import 'package:tp2_flutter_grupo12/widgets/usuarios_card.dart';
import 'package:tp2_flutter_grupo12/widgets/usuarios_search_bar.dart';
import 'package:tp2_flutter_grupo12/mocks/usuarios_mock.dart' show elements; // Importar el nuevo archivo

class UsuariosListScreen extends StatefulWidget {
  const UsuariosListScreen({super.key});

  @override
  State<UsuariosListScreen> createState() => _UsuariosListScreenState();
}

class _UsuariosListScreenState extends State<UsuariosListScreen> {
  List<Usuario> _auxiliarElements = [];
  String _searchQuery = '';
  bool _searchActive = false;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initializeUsuarios();
    _loadFavorites(); // Cargar favoritos desde SharedPreferences
  }

  void _initializeUsuarios() {
    _auxiliarElements = elements.map((element) {
      return Usuario(
        id: element[0],
        avatar: element[1],
        firstName: element[2],
        lastName: element[3],
        email: element[4],
        gender: element[5],
        country: element[6],
        isFavorite: false, // Por defecto no es favorito
      );
    }).toList();
  }

  // Cargar los favoritos desde SharedPreferences
  void _loadFavorites() async {
    for (var usuario in _auxiliarElements) {
      usuario.isFavorite = await FavoritesManager.loadFavorite(usuario.id.toString());
    }
    setState(() {}); // Actualizar la UI
  }

  // Actualizar la búsqueda de usuarios
  void _updateSearch(String? query) {
    setState(() {
      _searchQuery = query ?? '';
      if (_searchQuery.isEmpty) {
        _initializeUsuarios(); // Restablecer la lista completa
      } else {
        _auxiliarElements = elements.where((element) {
          final fullName = '${element[2]} ${element[3]}'.toLowerCase();
          return fullName.contains(_searchQuery.toLowerCase());
        }).map((element) {
          return Usuario(
            id: element[0],
            avatar: element[1],
            firstName: element[2],
            lastName: element[3],
            email: element[4],
            gender: element[5],
            country: element[6],
            isFavorite: false,
          );
        }).toList();
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

  // Lista de usuarios
  Expanded listItemsArea() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _auxiliarElements.length,
        itemBuilder: (BuildContext context, int index) {
          final usuario = _auxiliarElements[index];

          return UsuariosCard(
            avatar: usuario.avatar,
            firstName: usuario.firstName,
            lastName: usuario.lastName,
            gender: usuario.gender,
            country: usuario.country,
            isFavorite: usuario.isFavorite,
            onFavoriteTap: () async {
              setState(() {
                usuario.isFavorite = !usuario.isFavorite;
              });
              await FavoritesManager.saveFavorite(usuario.id.toString(), usuario.isFavorite);
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsuarioDetailScreen(
                    usuario: usuario, 
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