

import 'package:fltestadobloc/models/cliente.dart';
import 'package:fltestadobloc/services/cliente-service.dart';
import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ClientePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.start ,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                  child: Text('Ingresar Cliente', 
                    style: TextStyle( fontSize:20.0 ),
                    textAlign: TextAlign.left,)
                ),
                
                _fomulario(),
                
                _buttonFormulario(context),

              ],
              
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
    final servCliente = Provider.of<ClienteServices>( context, listen: false);
    return SizedBox(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
        children: [
          
          ElevatedButton.icon
          (   onPressed: () async  {
                print( _onGuardarCliente() );
                print(' click 001 ');
                final response = await servCliente.addCliente( _onGuardarCliente() );
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
              }, 
              icon: Icon(Icons.save, size: 30.0,),
              label: Text('Guardar'),
          ),          
        ],
      ) ,
    );
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


}