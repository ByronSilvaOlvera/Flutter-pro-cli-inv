
import 'package:flutter/material.dart';


import 'package:fltestadobloc/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de Logistico'),
      ),

      body: Text('Menu'),

      bottomNavigationBar: NavigationBotton()
    
    );
  }
}