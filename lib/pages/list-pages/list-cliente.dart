
import 'package:fltestadobloc/models/cliente.dart';
import 'package:flutter/material.dart';


import 'package:fltestadobloc/services/cliente-service.dart';

class ListadoCliente extends StatefulWidget {
  
  @override
  _ListadoClienteState createState() => _ListadoClienteState();
}

class _ListadoClienteState extends State<ListadoCliente> {
  final servCliente = new ClienteServices();
  
  List<Cliente> clientes = [];

  @override
  void initState()  { 
    _cargarCliente();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
        Column(
          children: <Widget>[
            SizedBox(
              height: 25.0,
              child: Center(child: Text('Listados de los Clientes') ),
            ),
            Expanded(
              child : _listadoClientes(context)
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
          return 
            ListTile(
              title: Text(clientes[index].nombre +' '+ clientes[index].apellido ),
              subtitle: Text('Identidad #: ${ clientes[index].identificacion}') ,
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.edit),
            
          );
        }
    );
    
  }

  void _cargarCliente() async {
    clientes = await  servCliente.getCliente();
    setState(() {
      
    });
  }

}