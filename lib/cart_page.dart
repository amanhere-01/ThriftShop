import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrift_shop/cart_provider.dart';

import 'global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart= Provider.of<CartProvider>(context).cart;
    final cart= context.watch<CartProvider>().cart;     // this is short hand syntax for above

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem= cart[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                radius: 35,
                backgroundColor: const Color.fromRGBO(169, 238, 230, 1),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text(
                          'Delete Item',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: const Text('Are you sure you want to delete this?',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed:(){
                                Navigator.of(context).pop();
                                },
                              child: const Text('No',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue
                                ),
                              )
                          ),
                          TextButton(
                              onPressed:(){
                                // Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                                context.read<CartProvider>().removeProduct(cartItem);   // click on read and read docs
                                Navigator.of(context).pop();
                              },
                              child: const Text('Yes',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red
                                ),
                              )
                          )
                        ],
                      );
                    }
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.red,),
              ),
              title: Text(
                cartItem['title'] as String,    // we have to typecast it as Map<String,Object> so cartItem['title] returns value of type Object
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text('Strap: ${cartItem['strap']}' ,
                style: const TextStyle(
                  fontSize: 16,
                ),),
            ),
          );
        }
      )
    );
  }
}
