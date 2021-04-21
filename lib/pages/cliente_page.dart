import 'package:fltestadobloc/models/cliente.dart';
import 'package:flutter/material.dart';
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
                
                _buttonFormulario(),

              ],
              
            ),
          ),
                
      );
  }

  
  _onGuardarCliente(){
    final cliente = new Cliente({
      nombreCtrl.text,
      apellidoCtrl.text,
      identidadCtrl.text,
      direccionCtrl.text,
      correoCtrl.text
    }
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

  Widget _buttonFormulario(){
    return SizedBox(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
        children: [
          
          ElevatedButton.icon
          (     onPressed: ()=> {}, 
                icon: Icon(Icons.home, size: 30.0,),
                label: Text('Inicio'),
          ),

          ElevatedButton.icon
          (     onPressed: ()=> {}, 
                icon: Icon(Icons.save, size: 30.0,),
                label: Text('Guardar'),
          ),
          

        ],
      ) ,
    );
  }

}