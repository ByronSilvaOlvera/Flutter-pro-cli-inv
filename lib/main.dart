
import 'package:flutter/material.dart';


import 'package:fltestadobloc/router/router.dart';  


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Material App Bar'),
      //   ),
      //   body: Center(
      //     child: Container(
      //       child: Text('Hola Byron'),
      //     ),
      //   ),
      // ), 
      
      //Zona de Rutas
      initialRoute: 'home',
      routes: appRoutesBy,

    );
  }
}