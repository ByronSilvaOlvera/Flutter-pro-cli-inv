
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fltestadobloc/models/cliente.dart';
import 'package:fltestadobloc/services/cliente-service.dart';
import 'package:fltestadobloc/widgets/widgets.dart';
class ClientePage extends StatefulWidget {
  final String id;
  ClientePage({ this.id = ''});
  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  final _servCliente = new ClienteServices();

  Cliente _cliente;

  @override
  void initState() { 
    _onIniciarCliente();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40.0,
                child: Text('Ingresar Cliente', 
                  style: TextStyle( fontSize:20.0 ),
                  textAlign: TextAlign.left,)
              ),
              
              _fomulario(),
              SizedBox(height: 20.0,),
              _buttonFormulario(context),

            ],            
          ),
        ),
      ),                
    );
  }

  _onGuardarCliente(){
    return Cliente(
      nombre        : nombreCtrl.text,
      apellido      : apellidoCtrl.text,
      identificacion: identidadCtrl.text,
      direccion     : direccionCtrl.text,
      correo        : correoCtrl.text    
    );
    
  }

  _onIniciarCliente() async {
    print(widget.id);
    if( widget.id.isNotEmpty ){
      
      _cliente = await _servCliente.getEntidadOne( widget.id );
      if( _cliente != null ){
        nombreCtrl.text    = _cliente.nombre;
        apellidoCtrl.text  = _cliente.apellido;
        identidadCtrl.text = _cliente.identificacion;
        direccionCtrl.text = _cliente.direccion;
        correoCtrl.text    = _cliente.correo;    
        _nombreMetodo = 'Editar';
        _guardar = false;
        setState(() {});
      }
    }
  }

  final nombreCtrl    = TextEditingController();
  final apellidoCtrl  = TextEditingController();
  final identidadCtrl = TextEditingController();
  final direccionCtrl = TextEditingController();
  final correoCtrl    = TextEditingController();

  Widget _fomulario(){
    return Column(
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 120.0,
          child: CircleAvatar(
            
            child: Icon(Icons.person_add, size: 50.0, color: Colors.blue[100],),
          ),
        ),
        
        SizedBox(height: 15.0,),
        //NAME
        TextField(
            obscureText: false,
            controller: nombreCtrl,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              border: OutlineInputBorder(),
              labelText: 'Nombre',
            ),
          ),
        SizedBox(height: 15.0,),
        
        
        TextField(
          obscureText: false,
          controller: apellidoCtrl,
          decoration: InputDecoration(
            icon: Icon(Icons.person_outline),
            border: OutlineInputBorder(),
            labelText: 'Apellido',
          ),
        ),

        SizedBox(height: 15.0,),

        TextField(
          obscureText: false,
          controller: identidadCtrl,
          decoration: InputDecoration(
            icon: Icon(Icons.confirmation_number_outlined),
            border: OutlineInputBorder(),
            labelText: 'Identificacion',
          ),
        ),
        SizedBox(height: 15.0,),

        TextField(
          obscureText: false,
          controller: direccionCtrl,
          decoration: InputDecoration(
            icon: Icon(Icons.add_to_home_screen_sharp),
            border: OutlineInputBorder(),
            labelText: 'Direccion',
          ),
        ),
        SizedBox(height: 15.0,),

        TextField(
          obscureText: false,
          controller: correoCtrl,
          decoration: InputDecoration(
            icon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(),
            labelText: 'Correo',
          ),
        ),
      ],
    );
  }

  Widget _buttonFormulario(BuildContext context){    
    return SizedBox(
      height: 50.0,
      width: 200.0,
      child:           
        ElevatedButton.icon(   
          onPressed: () => _metodoAlmacenamiento(context) , 
          icon: Icon(Icons.save, size: 30.0,),
          label: Text(_nombreMetodo),
        ),
    );
  }

  bool _guardar = true;
  String _nombreMetodo = 'Guardar';
  _metodoAlmacenamiento( BuildContext context ) async {

    final servCliente = Provider.of<ClienteServices>( context, listen: false);
    if( _guardar ){
      final response = await servCliente.createEntidad( _onGuardarCliente() );
      
      if ( response.ok )
      {
        ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente alamcenado exitoso..!', tipo: 1, ).build(context) 
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          _mensajeBotton(Colors.redAccent.shade200, Icons.error_outline,response.msg)
        );
      }

    }else{
      final response = await servCliente.editEntidad( _onGuardarCliente() );
      
      if( response.ok ){
        ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente Actualizado exitoso..!', tipo: 1, ).build(context) 
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          _mensajeBotton(Colors.redAccent.shade200, Icons.error_outline,response.msg)
        );
      }

    }
    _guardar = true;
    _nombreMetodo = 'Guardar';
  }


  Widget _mensajeBotton(Color color, IconData iconData,String msg ){
    return SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,                        
          children: [                          
            Text(msg),
            Icon(iconData, color : Colors.white ),          
          ],
        ),
        backgroundColor: color, //Colors.blueAccent.shade200,        
      );
  }

  @override
  void dispose() {    
    //widget.id = '';
    super.dispose();
  }

}