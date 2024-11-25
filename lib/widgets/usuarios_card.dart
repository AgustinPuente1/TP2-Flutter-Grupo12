import 'package:flutter/material.dart';

class UsuariosCard extends StatelessWidget {
  final String avatar;
  final String firstName;
  final String lastName;
  final String gender;
  final String country;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const UsuariosCard({
    Key? key,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.country,
    required this.isFavorite,
    this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            'assets/avatars/$avatar.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 10),
          // Nombre y apellido
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  firstName,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(lastName),
              ],
            ),
          ),
          // Icono de género
          Icon(
            gender == "Male" ? Icons.male : Icons.female,
            color: gender == "Male" ? Colors.blue : Colors.pink,
          ),
          const SizedBox(width: 10),
          // Bandera del país
          Image.asset(
            'assets/flags/$country.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 10),
          // Estrella para favoritos
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border_outlined,
              color: Colors.yellow[700],
            ),
            onPressed: onFavoriteTap,
          ),
        ],
      ),
    );
  }
}