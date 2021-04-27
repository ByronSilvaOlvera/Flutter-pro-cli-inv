
import 'package:fltestadobloc/services/producto-service.dart';
import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  

import 'package:fltestadobloc/services/cliente-service.dart';
import 'package:fltestadobloc/services/proveedor-service.dart';
//import 'package:fltestadobloc/router/router.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ClienteServices(), ),
        ChangeNotifierProvider(create: (_)=> ProveedorServices(), ),
        ChangeNotifierProvider(create: (_)=> ProductoServices(), ),
      ],
      child: MaterialApp(
        title: 'Material App',

        //comentar
        //home: DetalleDocumento(titulo: 'Compra',),  
        home: Scaffold(
          body : DetalleListado(),  
        )
        //Zona de Rutas
        //initialRoute: 'home',
        //routes: appRoutesBy,

      ),
    );
  }
}