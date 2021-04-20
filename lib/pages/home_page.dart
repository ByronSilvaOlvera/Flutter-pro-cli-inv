
import 'package:fltestadobloc/pages/producto_page.dart';
import 'package:flutter/material.dart';

import 'cliente_page.dart';
import 'inventario.page.dart';


//import 'package:fltestadobloc/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de Logistico'),
      ),

      body: _setbody(),

      //bottomNavigationBar: NavigationBotton()
      bottomNavigationBar:BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          _itemBtnNavigator(Icon(Icons.home)  , 'Home'),
          _itemBtnNavigator(Icon(Icons.account_circle_sharp), 'Cliente'),
          _itemBtnNavigator(Icon(Icons.add_shopping_cart_sharp), 'Producto'),
          _itemBtnNavigator(Icon(Icons.build_circle_outlined), 'Inventario'),
                  
        ],
        onTap: (int i) => { 
          setState( () {
            index = i ;            
          })
        },
      )

    );
  }

  BottomNavigationBarItem _itemBtnNavigator(Icon icon, String name){
    return BottomNavigationBarItem(
      icon: icon,
      label: name,
      backgroundColor: Colors.amberAccent,

    );
  }

  Widget _setbody() {
    if( index == 1) {
      return ClientePage();
    }else if( index == 2 ){
      return ProductoPage();
    }
    // else if( index == 3 ){
    //   return InventarioPage();
    // }
    else {
      return InventarioPage();
    } 
  }

}