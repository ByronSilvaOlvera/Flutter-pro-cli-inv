
//import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';  

import 'package:fltestadobloc/services/producto-service.dart';
import 'package:fltestadobloc/services/cliente-service.dart';
import 'package:fltestadobloc/services/proveedor-service.dart';
import 'package:fltestadobloc/router/router.dart';

import 'bloc/compra/compras_bloc.dart';
//import 'package:fltestadobloc/widgets/widgets.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ClienteServices(), ),
        ChangeNotifierProvider(create: (_)=> ProveedorServices(), ),
        ChangeNotifierProvider(create: (_)=> ProductoServices(), ),

        //
       BlocProvider(create: ( _ ) => new CompraBloc() ),


      ],
      child: MaterialApp(
        title: 'Material App',
        locale:  Locale('es') ,
        
        //comentar TEST
        //home: DetalleDocumento(titulo: 'Compra',),  
        //home: DatosIdentidad(),
        
        //Zona de Rutas
        initialRoute: 'home',
        routes: appRoutesBy,

      ),
    );
  }
}