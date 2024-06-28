
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    return   Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(     // by this all the widgets will placed from bottom of notch
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Shoes\nCollection',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Expanded(           // this widget will help text field acquire remaining space
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
            )
          ],
        ),
      ),
    );
  }
}