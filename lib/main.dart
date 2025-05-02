import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providor2/providers/task_provider.dart';
import 'package:weatherapp/providers/task_provider.dart';
import 'package:weatherapp/providers/themeProvider.dart';

import 'home/task_home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),

        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        )
      ],
      child: const MyApp(),
      jnkkjn
    ),
  );
}

class ChangeNotifierProvider {
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).getTheme,
      home: TaskHome(),
    );
  }
}
