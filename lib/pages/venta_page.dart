import 'package:fltestadobloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
class VentaPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
 
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.start ,
          children: <Widget>[
            SizedBox(
              height: 40.0,
              child: Text('Ingreso Venta ', 
                style: TextStyle( fontSize:20.0 ),
                textAlign: TextAlign.left,)
            ),
            
            _vtaForm()

          ],
          
        ),
      ) 
      
    );
  }

  Widget _vtaForm(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Selecciona un Producto'),
            CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.green,
              child: IconButton(
                icon: const Icon(Icons.add_circle_outline),
                tooltip: 'Increase volume by 10',
                onPressed: () {},
              )
            )
          ],
        ),
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

}