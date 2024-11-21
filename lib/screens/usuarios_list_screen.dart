import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tp2_flutter_grupo12/widgets/usuarios_card.dart';
import 'package:tp2_flutter_grupo12/widgets/usuarios_search_bar.dart';
import 'package:tp2_flutter_grupo12/mocks/people_mock.dart' show elements;

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
    _auxiliarElements = elements;
  }

  @override
  void dispose() {
    // Limpiar el controlador al destruir el widget
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateSearch(String? query) {
    setState(() {
      _searchQuery = query ?? '';
      if (_searchQuery.isEmpty) {
        _auxiliarElements = elements; // Restablecer al estado original
      } else {
        _auxiliarElements = elements.where((element) {
          return element[1].toLowerCase().contains(_searchQuery.toLowerCase());
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

  Expanded listItemsArea() {
  return Expanded(
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _auxiliarElements.length,
      itemBuilder: (BuildContext context, int index) {
        final element = _auxiliarElements[index];

        return UsuariosCard(
          avatarPath: element[0],
          name: element[1],
          role: element[2],
          isFavorite: element[4],
          stars: element[3],
          onTap: () {
            Navigator.pushNamed(
              context,
              'custom_list_item',
              arguments: {
                'avatar': element[0],
                'name': element[1],
                'cargo': element[2],
                'stars': element[3],
                'favorite': element[4],
              },
            );
          },
        );
      },
    ),
  );
}

  
}