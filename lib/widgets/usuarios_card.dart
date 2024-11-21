import 'package:flutter/material.dart';

class UsuariosCard extends StatelessWidget {
  final String avatarPath;
  final String name;
  final String role;
  final bool isFavorite;
  final int stars;
  final VoidCallback? onTap;

  const UsuariosCard({
    Key? key,
    required this.avatarPath,
    required this.name,
    required this.role,
    required this.isFavorite,
    required this.stars,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(31, 206, 219, 246),
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            // Imagen del avatar
            Image.asset(
              'assets/avatars/$avatarPath.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 10),
            // Información del usuario
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(role),
                ],
              ),
            ),
            // Icono y estrellas
            Icon(
              isFavorite ? Icons.star : Icons.star_border_outlined,
              color: Colors.yellow[700],
            ),
            const SizedBox(width: 5),
            Text('$stars'),
          ],
        ),
      ),
    );
  }
}