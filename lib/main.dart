
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrift_shop/cart_provider.dart';
import 'package:thrift_shop/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp  extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Mukta',      // default font style
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(22, 236, 93, 1),     // this will be the accent color
              primary:  const Color.fromRGBO(22, 236, 93, 1),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 25,
              color: Colors.black
            )
          ),
          inputDecorationTheme: const InputDecorationTheme(     // set here the theming of text field and it will be treated as default
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
          ),
          textTheme: const TextTheme(         // setting theme for textView
            titleLarge: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
            bodySmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )
        ),
        home: const HomePage(),
      ),
    );
  }
}

