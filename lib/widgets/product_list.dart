import 'package:flutter/material.dart';
import 'package:thrift_shop/widgets/product_card.dart';
import 'package:thrift_shop/pages/product_details_page.dart';

import '../global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const['All' , 'Richard Mille', 'Audemars Piguet' , 'Patek Philippe' , 'Cartier'];
  late String selectedFilter;

  @override
  void initState() {
    selectedFilter= filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const borderDesign = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
      borderSide: BorderSide(
          color: Color.fromRGBO(225, 225, 225, 1)
      ),
      // border:
    );

    return SafeArea(     // by this all the widgets will placed from bottom of notch
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Watches\nCollection',
                    style: Theme.of(context).textTheme.titleLarge
                ),
              ),
              const Expanded(           // this widget will help text field acquire remaining space
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      focusedBorder: borderDesign,
                      enabledBorder: borderDesign
                    // enabledBorder:
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index){
                  final filter= filters[index];
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8),    // this padding is between Chips

                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        label: Text(filter,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        padding: const EdgeInsets.all(13),   // this padding is for inside of particular chip
                        backgroundColor: selectedFilter == filter ? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide( color: Color.fromRGBO(245, 247, 249, 1)),    // to set border color
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context,index){
                final product= products[index];
                final title= product['title'] as String;
                final price= product['price'] as double;
                final image= product['imageUrl'] as String;
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  ProductDetailsPage(product: product,)
                        )
                    );
                  },
                  child: ProductCard(
                      title: title ,
                      price: price,
                      image:image ,
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(190, 212, 213, 1)
                          : const Color.fromRGBO(213, 190, 196, 1 )
                  ),
                );
              },
            ),
          )
        ],
      ),
    );

  }
}
