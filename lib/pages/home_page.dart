
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
  final int inicioIndex;
  final String id;
  HomePage({ this.inicioIndex = 0, this.id});
  int getIndex() => inicioIndex;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0 ;
  bool local = false;
  String _cliente;
 
 @override
  void initState() {

    super.initState();
    int intPagina = widget.getIndex();
    if ( intPagina > 0 ){
      index = intPagina;
      _cliente = widget.id;
    }
  }

  @override
  void dispose() {
    index = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de Logistico'),        
      ),

      body: _setbody() ,
      

      //bottomNavigationBar: NavigationBotton()
      bottomNavigationBar:BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          _itemBtnNavigator(Icon(Icons.home)  , 'Home'),
          _itemBtnNavigator(Icon(Icons.person_add), 'Cliente'),
          _itemBtnNavigator(Icon(Icons.add_shopping_cart_sharp), 'Producto'),
          _itemBtnNavigator(Icon(Icons.person_add_alt_1), 'Proveedor'),
          _itemBtnNavigator(Icon(Icons.verified_rounded), 'Venta'),
          _itemBtnNavigator(Icon(Icons.settings_input_composite_rounded), 'Compra'),
          _itemBtnNavigator(Icon(Icons.list), 'Listados'),
                  
        ],
        currentIndex: index ,
        selectedItemColor: Colors.amber[800],
        onTap: (int i) => { 
          setState( () {
            index = i ;
            local = true;        
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
      if( local ){
        local = false;
        return ClientePage();      
      }else{
        return ClientePage(id: _cliente,);
      }
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