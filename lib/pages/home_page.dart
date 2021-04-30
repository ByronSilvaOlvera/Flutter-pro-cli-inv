


import 'package:fltestadobloc/bloc/compra/compras_bloc.dart';
import 'package:fltestadobloc/models/compra.dart';
import 'package:flutter/material.dart';

import 'package:fltestadobloc/pages/compra_page.dart';
import 'package:fltestadobloc/pages/list-pages/list-option.dart';
import 'package:fltestadobloc/pages/producto_page.dart';
import 'package:fltestadobloc/pages/proveedor_page.dart';
import 'package:fltestadobloc/pages/venta_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
  String _proveedor;
  String _producto;
 
 @override
  void initState() {

    super.initState();
    int intPagina = widget.getIndex();
    if ( intPagina > 0 ){
      index = intPagina;
      if( intPagina ==  1){
        _cliente = widget.id;
      }else if( intPagina == 3){ // 3
        _proveedor = widget.id;
      }else if( intPagina == 2 ){
        _producto = widget.id;
      }
    }
  }

  @override
  void dispose() {
    index = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final compraBloc =  BlocProvider.of<CompraBloc>(context);

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
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end ,
        children: [
          FloatingActionButton(
            heroTag: 'btn-delete',
            onPressed: () {
              
              print(compraBloc.state.compraIniciada);
              print(compraBloc.state.compra );
              // DELETE COMPRA
              compraBloc.add( BorrarCompra( )  );

              print('hola mundo');
              print(compraBloc.state.compraIniciada);
              print(compraBloc.state.compra);
              
            }, 
            backgroundColor: Colors.red ,
            child: Icon(Icons.delete , color: Colors.red[200],)
          ),

          SizedBox(width: 25.0 ,),
          
          FloatingActionButton(
            heroTag: 'btn-envio',
            onPressed: () {

              // CREAR COMPRA  
              final newCompra = new Compra( uid: '123' );
              compraBloc.add( CrearCompra( newCompra )  );
              print('hola mundo');
              print( compraBloc.state.compraIniciada );
              print( compraBloc.state.compra );
                  
            }, 
             backgroundColor: Colors.green ,
            child: Icon(Icons.adb_rounded, color : Colors.green[100] )
          ),
          SizedBox(width: 25.0 ,),
          FloatingActionButton(
            heroTag: 'btn-comprobar',
            onPressed: () {

             print( compraBloc.state.compra.uid );
              print( compraBloc.state.compraIniciada );
              print( compraBloc.state.compra );
                  
            }, 
             backgroundColor: Colors.orange,
            child: Icon(Icons.ac_unit , color : Colors.green[100] )
          ),


        ],
      ),

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
      if( local ){
        local = false;
        return ProductoPage();      
      }else{
        return ProductoPage(id: _producto,);
      }
    }
    else if( index == 3 ){
      if( local ){
        local = false;
        return ProveedorPage();      
      }else{
        return ProveedorPage(id: _proveedor,);
      }
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