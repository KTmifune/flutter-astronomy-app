import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_iamge_app/screen/detail/astronomy_detail.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astronomy App',
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: const AstronomyDetailScreen(),
    );
  }
}
