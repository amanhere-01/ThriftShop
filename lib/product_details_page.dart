import 'package:flutter/material.dart';
import 'package:thrift_shop/home_page.dart';

class ProductDetailsPage extends StatefulWidget{
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product,});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String selectedStrap ='None';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge
            ),
          ),
          const Spacer(),
          Image.asset(widget.product['imageUrl'] as String,),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration:  const BoxDecoration(
              color: Color.fromRGBO(228, 236, 222, 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$${widget.product['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['straps'] as List<String>).length,
                      itemBuilder: (context, index){
                        final strap = (widget.product['straps'] as List<String>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedStrap=strap;
                              });
                            },
                            child: Chip(
                              label: Text(strap,
                                style: const TextStyle(
                                  fontSize: 15
                                ),
                              ),
                              backgroundColor: selectedStrap==strap ? const Color.fromRGBO(143, 238, 184, 1) : null,
                              padding: const EdgeInsets.all(5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.black,
                          minimumSize:  const Size(double.infinity,50), // setting size of button
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          )
                      ),
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Add to cart',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    ),
                  )
                  // ElevatedButton.icon(onPressed: onPressed, label: label)
                ],
              ),
            )
          )


        ],
      ),
    );
  }
}