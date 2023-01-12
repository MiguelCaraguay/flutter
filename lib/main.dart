import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grupal/screens/contacts_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Contactos Sqlite';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    themeMode: ThemeMode.dark,
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
    ),
    home: NotesPage(),
  );
}
