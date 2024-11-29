import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2_flutter_grupo12/screens/screens.dart';
import 'package:tp2_flutter_grupo12/helpers/preferences.dart';
import 'package:tp2_flutter_grupo12/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routes: {
            'home': (context) => const HomeScreen(),
            'profile': (context) => const ProfileScreen(),
            'balot_list': (context) => const BalotListScreen(),
            'movie_details': (context) => const MovieDetailsScreen(),
            'jugadores_list': (context) => const JugadoresListScreen(),
            'jugador_details': (context) => const JugadoresDetailsScreen(),
            'usuarios_list': (context) => const UsuariosListScreen(),
          },
        );
      },
    );
  }
}