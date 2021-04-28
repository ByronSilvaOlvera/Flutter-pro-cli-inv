
import 'dart:ui';

import 'package:fltestadobloc/models/cliente.dart';
import 'package:fltestadobloc/pages/home_page.dart';
import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:flutter/material.dart';


import 'package:fltestadobloc/services/cliente-service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListadoCliente extends StatefulWidget {
  
  @override
  _ListadoClienteState createState() => _ListadoClienteState();
}

class _ListadoClienteState extends State<ListadoCliente> {

  final servCliente = new ClienteServices();
  List<Cliente> clientes = [];

  @override
  void initState()  { 
    super.initState();
    _cargarCliente();
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
                child: Text('Listados de los Clientes #$_numerosCliente', 
                    style: TextStyle( color: Colors.blue.shade700, 
                           fontSize: 18.0 ),
                ), 
              ),
            ),
            Expanded(
              child : _listadoClientes(context),
            ),
          ],
        ),
    
    );
  }

  Widget _listadoClientes(BuildContext context){
    //double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 7.0) ,
      itemCount: clientes.length ,
      itemBuilder: (context , int index){  
        return Slidable(
          actionPane: SlidableScrollActionPane(),
          actionExtentRatio: 1/3,
          child: Card( 
            color: Colors.blue.shade50,
            child: ListTile(
              title   : Text(clientes[index].nombre +' '+ clientes[index].apellido ),
              subtitle: Text('Identificación: ${ clientes[index].identificacion}') ,
              leading : Icon(Icons.account_circle, color: Colors.blue.shade700, size: 40.0,),
              trailing: clientes[index].estadoregistro != "A" ? Icon(Icons.do_disturb_on_rounded, color: Colors.red.shade700 ) :
                            Icon(Icons.done_all, color: Colors.green.shade700 ) ,
            )
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: clientes[index].estadoregistro == "A" ? 'Desactivar' : 'Activar',
              color  : clientes[index].estadoregistro == "A" ? Colors.red.shade200 : Colors.green.shade200,
              icon   : clientes[index].estadoregistro == "A" ? Icons.person_remove_outlined : Icons.emoji_people_sharp,
              foregroundColor: clientes[index].estadoregistro == "A" ? Colors.red.shade900 : Colors.green.shade900,
              onTap: () => _activarDesactivarCliente(clientes[index].uid,
                clientes[index].estadoregistro == "A" ? 'I' : 'A')                           
            ),
          
            IconSlideAction(
              caption        : 'Editar',
              color          : Colors.lightBlue.shade200,
              icon           : Icons.drive_file_rename_outline,
              foregroundColor: Colors.lightBlue.shade900,
              onTap: () => {
                Navigator.pushReplacement(context,
                  PageRouteBuilder(
                    pageBuilder: ( _, __, ___) => HomePage(inicioIndex: 1, id:  clientes[index].uid, ),
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

  _activarDesactivarCliente (String id, String estado) async {
    final respuesta = await servCliente.activarEntidad(id, estado);
    if( respuesta.ok && estado == 'A' ){
      ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente Activado..!', tipo: 1, ).build(context));
      _cargarCliente();
    }else{
      ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente Desactivado..!', tipo: 0, ).build(context));
      _cargarCliente();
    }
  }

  int _numerosCliente = 0;
  void _cargarCliente() async {
    clientes = await  servCliente.getEntidad();
    _numerosCliente = clientes.length;
    setState(() {});
  }

}