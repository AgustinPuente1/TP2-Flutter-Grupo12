import 'package:flutter/material.dart';
import 'package:tp2_flutter_grupo12/screens/screens.dart';
import 'package:tp2_flutter_grupo12/helpers/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(),
        routes: {
          'home': (context) => const HomeScreen(),
          'custom_list': (context) => const CustomListScreen(),
          'profile': (context) => const ProfileScreen(),
          'custom_list_item': (context) => const CustomListItem(),
        }
        /* home: DesignScreen(), */
        );
  }
}