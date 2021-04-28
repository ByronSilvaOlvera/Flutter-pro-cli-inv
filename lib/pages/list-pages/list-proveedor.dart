
import 'package:flutter/material.dart';


import 'package:fltestadobloc/models/proveedor.dart';
import 'package:fltestadobloc/pages/home_page.dart';
import 'package:fltestadobloc/widgets/widgets.dart';


import 'package:fltestadobloc/services/proveedor-service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListadoProveedors extends StatefulWidget {
  
  @override
  _ListadoProveedorsState createState() => _ListadoProveedorsState();
}

class _ListadoProveedorsState extends State<ListadoProveedors> {

  final servProveedor = new ProveedorServices();
  List<Proveedor> proveedors = [];

  @override
  void initState()  { 
    super.initState();
    _cargarProveedor();
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
                child: Text('Listados de los Proveedores #$_numeroProveedores', 
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
      itemCount: proveedors.length ,
      itemBuilder: (context , int index){  
        return Slidable(
          actionPane: SlidableScrollActionPane(),
          actionExtentRatio: 1/3,
          child: Card( 
            color: Colors.green.shade50,
            child: ListTile(
              title   : Text(proveedors[index].nombre +' '+ proveedors[index].apellido ),
              subtitle: Text('Identificación: ${ proveedors[index].identificacion}') ,
              leading : Icon(Icons.account_circle_outlined, color: Colors.green.shade700, size: 40.0,),
              trailing: proveedors[index].estadoregistro != "A" ? Icon(Icons.do_disturb_on_rounded, color: Colors.red.shade700 ) :
                            Icon(Icons.done_all, color: Colors.green.shade700 ) ,
            )
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: proveedors[index].estadoregistro == "A" ? 'Desactivar' : 'Activar',
              color  : proveedors[index].estadoregistro == "A" ? Colors.red.shade200 : Colors.green.shade200,
              icon   : proveedors[index].estadoregistro == "A" ? Icons.person_remove_outlined : Icons.emoji_people_sharp,
              foregroundColor: proveedors[index].estadoregistro == "A" ? Colors.red.shade900 : Colors.green.shade900,
              onTap: () => _activarDesactivarProveedor(proveedors[index].uid,
                proveedors[index].estadoregistro == "A" ? 'I' : 'A')                           
            ),
          
            IconSlideAction(
              caption        : 'Editar',
              color          : Colors.lightBlue.shade200,
              icon           : Icons.drive_file_rename_outline,
              foregroundColor: Colors.lightBlue.shade900,
              onTap: () => {
                Navigator.pushReplacement(context,
                  PageRouteBuilder(
                    pageBuilder: ( _, __, ___) => HomePage(inicioIndex: 3, id:  proveedors[index].uid, ),
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
    final respuesta = await servProveedor.activarEntidad(id, estado);
    if( respuesta.ok && estado == 'A' ){
      ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente Activado..!', tipo: 1, ).build(context));
      _cargarProveedor();
    }else{
      ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente Desactivado..!', tipo: 0, ).build(context));
      _cargarProveedor();
    }
  }


  int _numeroProveedores = 0;
  void _cargarProveedor() async {
    proveedors = await  servProveedor.getEntidad();
    _numeroProveedores = proveedors.length;
    setState(() {});
  }

}