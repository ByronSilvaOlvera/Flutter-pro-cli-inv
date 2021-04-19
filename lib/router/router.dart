


import 'package:fltestadobloc/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:fltestadobloc/pages/producto_page.dart';

   final Map<String , Widget Function(BuildContext)> appRoutesBy = {
     'home'       : (_) => HomePage(),
     'productos'  : (_) => ProductoPage(),
     'cliente'    : (_) => ProductoPage(),
     'inventario' : (_) => ProductoPage(),
  };