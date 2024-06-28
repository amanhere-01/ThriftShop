
import 'package:flutter/material.dart';
import 'package:thrift_shop/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp  extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mukta',      // default font style
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(22, 236, 93, 1),     // this will be the accent color
            primary:  const Color.fromRGBO(22, 236, 93, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(     // set here the theming of text field and it will be treated as default
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
        )
      ),
      home: const HomePage(),
    );
  }
}

