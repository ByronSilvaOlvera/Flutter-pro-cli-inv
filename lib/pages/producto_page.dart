

import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children : [
          _formularioProducto(),
          _botonEnvioData(),
        ]
      ) 
        
    );
  }

  Widget _formularioProducto(){
    return Column(
      children: [
        SizedBox(
          width: 200.0,
          height: 120.0,
          child: CircleAvatar(
             backgroundColor: Colors.orange[700],
            child: Icon(Icons.add_shopping_cart_sharp, size: 50.0, color: Colors.orange[100] ),
          ),
        ),

          SizedBox(height: 18.0,),

          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.shopping_cart_outlined ),
              labelText: "Nombre producto"
            ),
          ),
          SizedBox(height: 18.0,),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.construction_sharp ),
              labelText: "Presentacion"
            ),
          ),
          SizedBox(height: 18.0,),
          TextField(
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
            decoration: InputDecoration(
              icon: Icon(Icons.comment_outlined ),
              labelText: "Descripción"
            ),
          ),
      ],
    );
  }

  Widget _botonEnvioData(){
    return Container(
      child: MaterialButton(
        onPressed: ()=>{},
        child: Text('Save', style: TextStyle( fontSize: 20.0, color: Colors.orange[100] ), ),
        color: Colors.orangeAccent.shade700,
        padding: EdgeInsets.symmetric(horizontal: 4.0 ),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }

}