import 'package:flutter/material.dart';

class UsuarioDetailScreen extends StatelessWidget {
  final Map<String, dynamic> usuario;

  const UsuarioDetailScreen({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${usuario['firstName']} ${usuario['lastName']}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Imagen grande del avatar
            ClipOval(
              child: Image.asset(
                'assets/avatars/${usuario['avatar']}.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Información del usuario
            ListTile(
              title: const Text("Nombre"),
              subtitle: Text('${usuario['firstName']} ${usuario['lastName']}'),
            ),
            ListTile(
              title: const Text("Correo Electrónico"),
              subtitle: Text(usuario['email']),
            ),
            ListTile(
              title: const Text("Género"),
              subtitle: Text(usuario['gender']),
            ),
            ListTile(
              title: const Text("País"),
              subtitle: Text(usuario['country']),
            ),
          ],
        ),
      ),
    );
  }
}