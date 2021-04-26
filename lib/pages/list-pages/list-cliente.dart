
import 'dart:ui';

import 'package:fltestadobloc/models/cliente.dart';
import 'package:fltestadobloc/pages/home_page.dart';
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
                child: Text('Listados de los Clientes', 
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
        itemCount: clientes.length ,
        itemBuilder: (context , int index){  
          return Slidable(
            actionPane: SlidableScrollActionPane(),
            actionExtentRatio: 1/3,
            child: Card( 
              color: Colors.blue.shade50,
              child: ListTile(
                title: Text(clientes[index].nombre +' '+ clientes[index].apellido ),
                subtitle: Text('Identidad #: ${ clientes[index].identificacion}') ,
                leading: Icon(Icons.account_circle, color: 
                  Colors.blue.shade700, size: 40.0,),
                //trailing: Icon(Icons.edit),
              
              )
            ),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Desactivar',
                color: Colors.red.shade200,
                icon: Icons.person_remove_outlined,
                foregroundColor: Colors.red.shade900,
                onTap: () => {},
              ),
              IconSlideAction(
                caption: 'Editar',
                color: Colors.lightBlue.shade200,
                icon: Icons.drive_file_rename_outline,
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

  void _cargarCliente() async {
    clientes = await  servCliente.getEntidad();
    setState(() {
      
    });
  }

}