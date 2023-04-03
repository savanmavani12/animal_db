import 'package:animal_db/screens/details_page.dart';
import 'package:animal_db/screens/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'DetailsPage' : (context) => const DetailsPage(),
      },
    ),
  );
}
