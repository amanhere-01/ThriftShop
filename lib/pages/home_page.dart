import 'package:flutter/material.dart';
import 'package:thrift_shop/pages/cart_page.dart';
import 'package:thrift_shop/widgets/product_list.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage=0;
  List<Widget> pages= const[ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      // body: pages[currentPage],  We can use this but if we go back at home after cart page then product list will start from top again
      body:  IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,  // since we don't wanna show label but it will take space even though it is empty string so we gotta make fontSize 0
        unselectedFontSize: 0,
        currentIndex: currentPage ,
        onTap: (value){
          setState(() {
            currentPage=value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: ''
          )
        ]
      ),
    );
  }
}