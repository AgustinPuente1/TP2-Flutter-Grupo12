import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp2_flutter_grupo12/service/usuarios_favorites.dart';

class UsuarioDetailScreen extends StatefulWidget {
  final Map<String, dynamic> usuario;

  const UsuarioDetailScreen({Key? key, required this.usuario}) : super(key: key);

  @override
  State<UsuarioDetailScreen> createState() => _UsuarioDetailScreenState();
}

class _UsuarioDetailScreenState extends State<UsuarioDetailScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.usuario['isFavorite'];
  }

  // Guardar el estado del favorito
  void _saveFavorite() async {
    await FavoritesManager.saveFavorite(widget.usuario['id'].toString(), isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${widget.usuario['firstName']} ${widget.usuario['lastName']}'),
            Text(
              'ID: ${widget.usuario['id']}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Imagen del avatar con fondo contrastante
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/avatars/${widget.usuario['avatar']}.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Botón de favoritos con estrella
            IconButton(
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? Colors.amber : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  widget.usuario['isFavorite'] = isFavorite;
                });
                _saveFavorite(); // Guardar el estado actualizado
              },
            ),
            const SizedBox(height: 20),
            // Información del usuario
            ListTile(
              title: const Text("Nombre"),
              subtitle: Text('${widget.usuario['firstName']} ${widget.usuario['lastName']}'),
            ),
            ListTile(
              title: const Text("Correo Electrónico"),
              subtitle: Text(widget.usuario['email']),
            ),
            ListTile(
              title: const Text("Género"),
              subtitle: Row(
                children: [
                  Icon(
                    widget.usuario['gender'] == "Male" ? Icons.male : Icons.female,
                    color: widget.usuario['gender'] == "Male" ? Colors.blue : Colors.pink,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(widget.usuario['gender']),
                ],
              ),
            ),
            ListTile(
              title: const Text("País"),
              subtitle: Row(
                children: [
                  Image.asset(
                    'assets/flags/${widget.usuario['country']}.png',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(widget.usuario['country']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
