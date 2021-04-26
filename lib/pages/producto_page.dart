

import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:flutter/material.dart';


import 'package:fltestadobloc/services/producto-service.dart';
import 'package:fltestadobloc/models/producto.dart';
import 'package:provider/provider.dart';

class ProductoPage extends StatefulWidget {
  final String id;
  ProductoPage({ this.id = ''});

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final _servProducto = new ProductoServices();
  Producto _producto;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          children : <Widget>[
            SizedBox(
              width: 200.0,
              height: 120.0,
              child: CircleAvatar(
                backgroundColor: Colors.orange[700],
                child: Icon(Icons.add_shopping_cart_sharp, size: 50.0, color: Colors.orange[100] ),
              ),
            ),

            _formularioProducto(),
            _botonEnvioData(context),
          ]
        ),
      ) 
        
    );
  }

  @override
  void initState() { 
    super.initState();
    _onIniciarPoducto();
  }

  _onIniciarPoducto() async {
    
    if( widget.id.isNotEmpty ){
      id.text = widget.id;
      _producto = await _servProducto.getEntidadOne( widget.id );
      if( _producto != null ){
        nombreCtrl.text       = _producto.nombre;
        presentacionCtrl.text = _producto.presentacion;
        unidadCtrl.text       = _producto.unidad.toString();
        descripcionCtrl.text  = _producto.descripcion;
        
        _nombreMetodo      = 'Editar';
        _guardar           = false;
        setState(() {});
      }
    }
  }

  final nombreCtrl       = TextEditingController();
  final presentacionCtrl = TextEditingController();
  final unidadCtrl       = TextEditingController();
  final descripcionCtrl  = TextEditingController();
  final id               = TextEditingController();

  Widget _formularioProducto(){
    return Column(
      children: [
      
          TextField(
            controller: nombreCtrl,
            decoration: InputDecoration(
              icon: Icon(Icons.shopping_cart_outlined ),
              labelText: "Nombre producto"
            ),
          ),
          SizedBox(height: 18.0,),
          TextField(
            controller: presentacionCtrl,
            decoration: InputDecoration(
              icon: Icon(Icons.construction_sharp ),
              labelText: "Presentacion"
            ),
          ),
          SizedBox(height: 18.0,),
          TextField(
            controller: unidadCtrl,
            decoration: InputDecoration(
              icon: Icon(Icons.burst_mode_sharp ),
              labelText: "Unidad de medida"
            ),
          ),
          SizedBox(height: 18.0,),
          TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 6,
            maxLines: null,
            controller: descripcionCtrl,
            decoration: InputDecoration(
              icon: Icon(Icons.comment_outlined ),
              labelText: "Descripción"
            ),
          ),
      ],
    );
  }

  _onGuardarProducto(){
    return Producto(
      nombre        : nombreCtrl.text,
      presentacion  : presentacionCtrl.text,
      unidad        : int.parse(unidadCtrl.text),
      descripcion   : descripcionCtrl.text,    
      uid           : id.text,
      estadoregistro: 'A'
    );
    
  }

  Widget _botonEnvioData(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0 ) ,
      width: 230.0,
      child: MaterialButton(
        minWidth: 80.0,
        onPressed: ()=> _metodoAlmacenamiento(context) ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Icon( Icons.edit, color: Colors.orange[300] , ),
            SizedBox( width: 7, ),
            Text(_nombreMetodo, style: TextStyle( fontSize: 20.0, color: Colors.orange[100] ), ),
          ],
        ),
        color: Colors.orangeAccent.shade700,
        padding: EdgeInsets.symmetric(horizontal: 4.0 ),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }

  bool _guardar = true;
  String _nombreMetodo = 'Guardar';
  _metodoAlmacenamiento( BuildContext context ) async {

    final servProveedor = Provider.of<ProductoServices>( context, listen: false);
    if( _guardar ){
      final response = await servProveedor.createEntidad( _onGuardarProducto() );
      
      if ( response.ok )
      {
        ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Producto alamcenado exitoso..!', tipo: 1, ).build(context) 
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
      final response = await servProveedor.editEntidad( _onGuardarProducto() );
      
      if( response.ok ){
        ScaffoldMessenger.of(context).showSnackBar( 
          MsgSnackBar( msg: 'Producto Actualizado exitoso..!', tipo: 1, ).build(context) 
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

  _onResetFormulario(){
    nombreCtrl.text       = "";
    unidadCtrl.text       = "";
    presentacionCtrl.text = "";
    descripcionCtrl.text  = "";
  }


}