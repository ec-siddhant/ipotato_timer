import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/database/db.dart';
import 'package:ipotato_timer/screens/home_screen/home_screen.dart';
import 'package:ipotato_timer/stores/timers_store.dart';
import 'package:ipotato_timer/themes/providers/theme_provider.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

Future<void> init() async {
  GetIt.I.registerSingleton<TimersStore>(TimersStore());
  GetIt.I.registerSingleton<MyTimerDatabase>(MyTimerDatabase());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final myThemes = MyThemes();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (ctx) => ThemeProvider()),
      ],
      child: FutureBuilder(
          future: GetIt.instance.allReady(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MaterialApp(
                title: 'iPotato Timer',
                themeMode: ThemeMode.light,
                theme: myThemes.buildLightTheme(),
                darkTheme: myThemes.buildDarkTheme(),
                home: HomeScreen(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
