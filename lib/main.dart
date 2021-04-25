
import 'package:fltestadobloc/services/cliente-service.dart';
import 'package:flutter/material.dart';


import 'package:fltestadobloc/router/router.dart';
import 'package:provider/provider.dart';  


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ClienteServices(), ),
      ],
      child: MaterialApp(
        title: 'Material App',
        
        //Zona de Rutas
        initialRoute: 'home',
        routes: appRoutesBy,

      ),
    );
  }
}