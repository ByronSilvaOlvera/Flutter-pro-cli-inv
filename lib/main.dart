
import 'package:flutter/material.dart';


import 'package:fltestadobloc/router/router.dart';  


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      
      //Zona de Rutas
      initialRoute: 'home',
      routes: appRoutesBy,

    );
  }
}