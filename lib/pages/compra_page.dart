

import 'dart:ui';

import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
class CompraPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    //_w = MediaQuery.of(context).size.width;

    return Container(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            
            _headerOperacion(context),

            _datosSeleccion(),

            _compraFormula(),

          ],          
        ),
      )       
    );
  }

  Widget _compraFormula(){
    return Column(
      children: [

        // _datosSeleccion('Seleccione un Articulo', 
        //   Icon(Icons.add_shopping_cart_sharp), Colors.orange.shade100, Colors.orange ),
        // SizedBox( height: 5.0 , ),
        // _datosSeleccion('Datos Compras', 
        //   Icon(Icons.account_circle_outlined), Colors.green, Colors.green.shade50 ),
        
        SizedBox(          
          height: 300.0,
          child: Container(
            child: TablaWidget(),
          ),
        ),
      
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end ,
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Text('SubTotal 0%: '),
              Text('SubTotal 12: '),                                 
              Text('Impuesto: '),
              Text('Total: '),
            ],),
        )
      ],
    );
  }

  Widget _datosSeleccion( ){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            //width:  _w/2,
            //height: 70.00,
            child: ListTile(
              title   : Row ( children : [ Icon(Icons.person), 
                  SizedBox(width: 5.0,),
                  Text('Byron Silva Olvera', style: TextStyle( fontSize: 18.00  ) ),
              ] ),
              subtitle: Row ( 
                children : [ 
                  Icon(Icons.fingerprint, size: 15.0), 
                  Text('0926113010001'),
                  SizedBox(width: 10.0,),
                  Icon(Icons.alternate_email, size: 15.0,), 
                  Text('byronsjimb@gmail.com')
                ] 
              ), 
            ) ,
          ),

          // SizedBox(
          //   width: _w/2,
          //   height: 70.00,
          //   child: ListTile(
          //     title   : Row ( children : [ Icon(Icons.home), Text('Florida Norte') ] ),
          //     subtitle: Row ( children : [ Icon(Icons.alternate_email), Text('byronsjimb@gmail.com') ] )
          //   ),            
          //)

        ],
      )   ,
    );
  }

  Widget _headerOperacion(BuildContext context ){
    return SizedBox(
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
        children: [

          Expanded(
            child: ListTile(
              title:Text('Compra #001-001-123456789', 
                style: TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold, 
                ),
                textAlign: TextAlign.left, ),
              subtitle: Text('27-04-2021 ', 
                style: TextStyle( fontSize: 15.0, fontWeight: FontWeight.bold, 
                ),
                textAlign: TextAlign.left, ),
            ),
          ) , 

            Column(
              children: [
                IconButton(icon: Icon(Icons.account_circle_outlined),
                  padding: EdgeInsets.zero,
                    onPressed: ()=>{
                      //IR A CREAR UN DETALLE DE LA COMPRA
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DatosIdentidad(),
                      ))
                    }),
                Center(child: Text('Datos', style: 
                  TextStyle(fontSize: 10.0 ),
                )),
              ],
            ),
            Column(
              children: [
                IconButton(icon: Icon(Icons.add_shopping_cart_sharp),
                  padding: EdgeInsets.zero, onPressed: ()=>{

                    //IR A CREAR UN DETALLE DE LA COMPRA
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductoOperacion(),
                    ))
                  
                  }),
                Center(child: Text('Articulos', style: 
                  TextStyle(fontSize: 10.0 ),
                )),
              ],
            )
        ],
      )
    );
  }

}