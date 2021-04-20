import 'package:flutter/material.dart';
class ClientePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
 
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start ,
          children: <Widget>[
            _fomulario(),
          ],
          
        ),
      ) 
      
    );
  }

  Widget _fomulario(){
    return Column(
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 120.0,
          child: CircleAvatar(
            child: Icon(Icons.person_add, size: 50.0,),
          ),
        ),
        
        SizedBox(height: 15.0,),
        TextField(
            obscureText: true,
            //controller: ,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              border: OutlineInputBorder(),
              labelText: 'Nombre',
            ),
          ),
        SizedBox(height: 15.0,),
        
        
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.person_outline),
            border: OutlineInputBorder(),
            labelText: 'Apellido',
          ),
        ),

        SizedBox(height: 15.0,),

        TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.confirmation_number_outlined),
            border: OutlineInputBorder(),
            labelText: 'Identificacion',
          ),
        ),
        SizedBox(height: 15.0,),

        TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.add_to_home_screen_sharp),
            border: OutlineInputBorder(),
            labelText: 'Direccion',
          ),
        ),
        SizedBox(height: 15.0,),

        TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(),
            labelText: 'Correo',
          ),
        ),
      ],
    );
  }

}