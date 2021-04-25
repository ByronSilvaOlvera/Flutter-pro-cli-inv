
import 'package:flutter/material.dart';

import 'package:fltestadobloc/pages/compra_page.dart';
import 'package:fltestadobloc/pages/list-pages/list-option.dart';
import 'package:fltestadobloc/pages/producto_page.dart';
import 'package:fltestadobloc/pages/proveedor_page.dart';
import 'package:fltestadobloc/pages/venta_page.dart';

import 'cliente_page.dart';
import 'inventario.page.dart';


//import 'package:fltestadobloc/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0 ;
  //PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de Logistico'),        
      ),

      body: SingleChildScrollView(
        child: _setbody() ,
      ),

      //bottomNavigationBar: NavigationBotton()
      bottomNavigationBar:BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          _itemBtnNavigator(Icon(Icons.home)  , 'Home'),
          _itemBtnNavigator(Icon(Icons.person_add), 'Cliente'),
          _itemBtnNavigator(Icon(Icons.add_shopping_cart_sharp), 'Producto'),
          _itemBtnNavigator(Icon(Icons.build_circle_outlined), 'Proveedor'),
          _itemBtnNavigator(Icon(Icons.verified_rounded), 'Venta'),
          _itemBtnNavigator(Icon(Icons.settings_input_composite_rounded), 'Compra'),
          _itemBtnNavigator(Icon(Icons.list), 'Vistas'),
                  
        ],
        currentIndex: index ,
        selectedItemColor: Colors.amber[800],
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
      // _pageController.animateToPage(
      //   index, 
      //   duration: Duration(milliseconds: 500), 
      //   curve: Curves.easeInOut
      // );
      
    if( index == 1) {
      return ClientePage();
    }else if( index == 2 ){
      return ProductoPage();
    }
    else if( index == 3 ){
      return ProveedorPage();
    }
    else if( index == 4 ){
      return VentaPage();
    }
    else if( index == 5 ){
      return CompraPage();
    }
    else if( index == 6 ){
      return ListaOpcionesBar();
    }
    else {
      return InventarioPage();
    } 
  }

}