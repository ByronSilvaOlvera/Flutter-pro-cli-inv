
import 'package:flutter/material.dart';


import 'package:fltestadobloc/services/producto-service.dart';
import 'package:fltestadobloc/models/producto.dart';
import 'package:fltestadobloc/pages/home_page.dart';
import 'package:fltestadobloc/widgets/widgets.dart';


import 'package:flutter_slidable/flutter_slidable.dart';

class ListadoProductos extends StatefulWidget {
  
  @override
  _ListadoProductosState createState() => _ListadoProductosState();
}

class _ListadoProductosState extends State<ListadoProductos> {

  final _servProducto = new ProductoServices();
  List<Producto> _productos = [];

  @override
  void initState()  { 
    super.initState();
    _cargarProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0 ) ,
      child: 
        Column(
          children: <Widget>[
            SizedBox(
              height: 25.0,
              child: Center(
                child: Text('Listados de Productos #$_numeroProductos', 
                    style: TextStyle( color: Colors.blue.shade700, 
                           fontSize: 18.0 ),
                ), 
              ),
            ),
            Expanded(
              child : _listadoProveedores(context),
            ),
          ],
        ),
    
    );
  }

  Widget _listadoProveedores(BuildContext context){
    //double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 7.0) ,
      itemCount: _productos.length ,
      itemBuilder: (context , int index){  
        return Slidable(
          actionPane: SlidableScrollActionPane(),
          actionExtentRatio: 1/3,
          child: Card( 
            color: Colors.orange[100],
            child: ListTile(
              title   : Text(_productos[index].nombre +' '+ _productos[index].nombre ),
              subtitle: Text('Presentacion: ${ _productos[index].presentacion}') ,
              leading : Icon(Icons.category_outlined, color: Colors.orange[700], size: 40.0,),
              trailing: _productos[index].estadoregistro != "A" ? Icon(Icons.do_disturb_on_rounded, color: Colors.red.shade700 ) :
                            Icon(Icons.done_all, color: Colors.green.shade700 ) ,
            )
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: _productos[index].estadoregistro == "A" ? 'Desactivar' : 'Activar',
              color  : _productos[index].estadoregistro == "A" ? Colors.red.shade200 : Colors.green.shade200,
              icon   : _productos[index].estadoregistro == "A" ? Icons.person_remove_outlined : Icons.emoji_people_sharp,
              foregroundColor: _productos[index].estadoregistro == "A" ? Colors.red.shade900 : Colors.green.shade900,
              onTap: () => _activarDesactivarProveedor(_productos[index].uid,
                _productos[index].estadoregistro == "A" ? 'I' : 'A')                           
            ),
          
            IconSlideAction(
              caption        : 'Editar',
              color          : Colors.lightBlue.shade200,
              icon           : Icons.drive_file_rename_outline,
              foregroundColor: Colors.lightBlue.shade900,
              onTap: () => {
                Navigator.pushReplacement(context,
                  PageRouteBuilder(
                    pageBuilder: ( _, __, ___) => HomePage(inicioIndex: 2, id:  _productos[index].uid, ),
                    transitionDuration: Duration(milliseconds: 0)
                  )
                )
              },
            ),             
          ]
        );
      }
    );
    
  }

  _activarDesactivarProveedor (String id, String estado) async {
    final respuesta = await _servProducto.activarEntidad(id, estado);
    if( respuesta.ok && estado == 'A' ){
      ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente Activado..!', tipo: 1, ).build(context));
      _cargarProductos();
    }else{
      ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente Desactivado..!', tipo: 0, ).build(context));
      _cargarProductos();
    }
  }

  int _numeroProductos = 0;
  void _cargarProductos() async {
    _productos = await  _servProducto.getEntidad();
    _numeroProductos = _productos.length;
    setState(() {});
  }

}