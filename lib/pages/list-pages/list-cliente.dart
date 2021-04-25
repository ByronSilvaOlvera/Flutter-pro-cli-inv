
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
      child: ListView.builder(
        itemCount: clientes.length ,
        itemBuilder: (BuildContext context , int index){  
          return _listadoClientes ( clientes[index] );
        }
      ),
    );
  }

  Widget _listadoClientes(Cliente item ){
    return SizedBox(
      height: 70.0,
      child: ListTile(
        title: Text(item.nombre +' '+ item.apellido ),
        subtitle: Text('Identidad #: ${ item.identificacion}') ,
        leading: Icon(Icons.account_circle),
        trailing: Icon(Icons.edit),
        
      ) ,
    );
  }

  void _cargarCliente() async {
    clientes = await  servCliente.getCliente();
    setState(() {
      
    });
  }

}