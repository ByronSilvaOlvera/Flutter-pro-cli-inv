

import 'dart:ui';

import 'package:fltestadobloc/bloc/compra/compras_bloc.dart';
import 'package:fltestadobloc/models/color-model.dart';
import 'package:fltestadobloc/models/compra.dart';
import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        ],
      )   ,
    );
  }

  Widget _headerOperacion(BuildContext context ){
    final compraBloc =  BlocProvider.of<CompraBloc>(context);
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
                    onPressed: () async {
                      //IR A CREAR UN DETALLE DE LA COMPRA
                      final DatosDocumento data = await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DatosIdentidad( operacion : 
                          ColorDetalle(
                            appbarcolor      : Colors.red[400] ,
                            fondocolor       : Colors.red[50],
                            iconcolor        : Colors.redAccent,
                            fechacolor       : Colors.red[100],
                            fechacoloricon   : Colors.red.shade900,
                            fechacoloriconbtn: Colors.red,
                            saveiconcolor    : Colors.amber[700],
                            titulos          : Titulos(
                              titulobar      : 'Compra',
                              tituloone      : 'Datos del Proveedor',
                              titulotwo      : 'Datos Generales'
                            )
                          )  
                         )
                        )
                      );

                      compraBloc.add( AddDatosProveedor(data) ) ;
                      
                    }),
                Center(child: Text('Datos', style: 
                  TextStyle(fontSize: 10.0 ),
                )),
              ],
            ),
            Column(
              children: [
                IconButton(icon: Icon(Icons.add_shopping_cart_sharp),
                  padding: EdgeInsets.zero, 
                  onPressed: () async {

                    //IR A CREAR UN DETALLE DE LA COMPRA
                    final String dt = await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductoOperacion( operacion : 
                        ColorDetalle(
                          appbarcolor      : Colors.pink[400] ,
                          fondocolor       : Colors.pink[50],
                          iconcolor        : Colors.pinkAccent,
                          fechacolor       : Colors.pink[100],
                          fechacoloricon   : Colors.pink.shade900,
                          fechacoloriconbtn: Colors.pink,
                          saveiconcolor    : Colors.amber[700],
                          titulos          : Titulos(
                            titulobar      : 'Compra',
                            tituloone      : 'Item de Mercaderia',
                            titulotwo      : 'Datos Generales'
                          )
                        )  
                      ),
                      )
                    );
                    print(dt); 
                  
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