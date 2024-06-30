import 'package:flutter/material.dart';

import 'global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: Colors.purple,
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
                onPressed: () {  },
                icon: const Icon(Icons.delete, color: Colors.red,),
              ),
              title: Text(
                cartItem['title'] as String,    // we have to typecast it as Map<String,Object> so cartItem['title] returns value of type Object
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text('Size: ${cartItem['strap']}' ,
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
