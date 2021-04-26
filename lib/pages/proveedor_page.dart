
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:fltestadobloc/models/proveedor.dart';
import 'package:fltestadobloc/services/proveedor-service.dart';


class ProveedorPage extends StatefulWidget {
  final String id;
  ProveedorPage({ this.id = ''});
  @override
  _ProveedorPageState createState() => _ProveedorPageState();
}

class _ProveedorPageState extends State<ProveedorPage> {
  final _servCliente = new ProveedorServices();

  Proveedor _proveedor;

  @override
  void initState() { 
    _onIniciarProveedor();
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
                width: 200.0,
                height: 120.0,
                child: CircleAvatar(
                  backgroundColor: Colors.green[50],
                  child: Icon(Icons.person_add_alt_1, size: 50.0, color: Colors.green.shade600),
                ),
              ),   
              SizedBox(height: 15.0,),                       
              _fomulario(),
              SizedBox(height: 20.0,),
              _buttonFormulario(context),

            ],            
          ),
        ),
      ),                
    );
  }

  _onGuardarProveedor(){
    return Proveedor(
      nombre        : nombreCtrl.text,
      apellido      : apellidoCtrl.text,
      identificacion: identidadCtrl.text,
      direccion     : direccionCtrl.text,
      correo        : correoCtrl.text,
      uid           : id.text,
      estadoregistro: 'A'
    );
    
  }

  _onIniciarProveedor() async {
    
    if( widget.id.isNotEmpty ){
      id.text = widget.id;
      _proveedor = await _servCliente.getEntidadOne( widget.id );
      if( _proveedor != null ){
        nombreCtrl.text    = _proveedor.nombre;
        apellidoCtrl.text  = _proveedor.apellido;
        identidadCtrl.text = _proveedor.identificacion;
        direccionCtrl.text = _proveedor.direccion;
        correoCtrl.text    = _proveedor.correo;    
        _nombreMetodo      = 'Editar';
        _guardar           = false;
        setState(() {});
      }
    }
  }

  final nombreCtrl    = TextEditingController();
  final apellidoCtrl  = TextEditingController();
  final identidadCtrl = TextEditingController();
  final direccionCtrl = TextEditingController();
  final correoCtrl    = TextEditingController();
  final id            = TextEditingController();

  Widget _fomulario(){
    return Column(
      children: <Widget>[
        
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
    return Container(
      child: MaterialButton(
        minWidth: 230.0,
        onPressed: () => _metodoAlmacenamiento(context),
        child: Text(_nombreMetodo, style: TextStyle( fontSize: 20.0, color: Colors.green[50] ), ),
        color: Colors.green.shade700,
        padding: EdgeInsets.symmetric(horizontal: 4.0 ),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }

  bool _guardar = true;
  String _nombreMetodo = 'Guardar';
  _metodoAlmacenamiento( BuildContext context ) async {

    final servProveedor = Provider.of<ProveedorServices>( context, listen: false);
    if( _guardar ){
      final response = await servProveedor.createEntidad( _onGuardarProveedor() );
      
      if ( response.ok )
      {
        ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente alamcenado exitoso..!', tipo: 1, ).build(context) 
        );
        _onResetFormulario();
        _guardar      = true;
        _nombreMetodo = 'Guardar';
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          _mensajeBotton(Colors.redAccent.shade200, Icons.error_outline,response.msg)
        );
      }

    }else{
      final response = await servProveedor.editEntidad( _onGuardarProveedor() );
      
      if( response.ok ){
        ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Cliente Actualizado exitoso..!', tipo: 1, ).build(context) 
        );
        _onResetFormulario();
        _guardar      = true;
        _nombreMetodo = 'Guardar';
        setState(() {});
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          _mensajeBotton(Colors.redAccent.shade200, Icons.error_outline, response.msg)
        );
      }

    }
    
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
    super.dispose();
  }

  _onResetFormulario(){
    nombreCtrl.text    = "";
    apellidoCtrl.text  = "";
    identidadCtrl.text = "";
    direccionCtrl.text = "";
    correoCtrl.text    = "";
    id.text            = "";
  }


}