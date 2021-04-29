
part of '../widgets.dart';


class DetalleDocumento extends StatefulWidget {
  //const DetalleDocumento({Key key}) : super(key: key);
  final String titulo;

  DetalleDocumento({ this.titulo = '' });

  @override
  _DetalleDocumentoState createState() => _DetalleDocumentoState();
}

class _DetalleDocumentoState extends State<DetalleDocumento> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _fomularioDetalle(),
    );
  }

  final elementoOneCtrl    = TextEditingController();

  final elementoTwoCtrl    = TextEditingController();

  final elementoThreeCtrl    = TextEditingController();

  Widget _fomularioDetalle(){
    return AlertDialog(
      title: Text( widget.titulo ),
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _componentesF('Producto',elementoOneCtrl ),
              _componentesF('Cantidad',elementoTwoCtrl ),
              _componentesF('Valor',elementoThreeCtrl ),
            ],
          ),
        ),
      ),

      actions: [
        MaterialButton(
          minWidth: 100.0,
          onPressed: () => {},
          child: Icon( Icons.close, color: Colors.deepOrange.shade900, ),
          color: Colors.deepOrange.shade300,
          padding: EdgeInsets.symmetric(horizontal: 4.0 ),
        ),
        MaterialButton(
          minWidth: 100.0,
          onPressed: () => {},
          child: Icon( Icons.save_alt, color: Colors.greenAccent.shade700, ) ,
          color: Colors.green.shade200,
          padding: EdgeInsets.symmetric(horizontal: 4.0 ),
        )
      ],

    );
  }

  Widget _componentesF(String label, TextEditingController control ){
    return SizedBox(
      height: 85.0,
      child: Column(
        children: [
          //Text(label, textDirection: TextDirection.rtl , ),
          TextField(
            
            controller: control ,
            decoration: InputDecoration(
              //icon: Icon(Icons.add_to_home_screen_sharp),
              border: OutlineInputBorder(),
              labelText: label,
            ),
          )
        ],
      ),
    );
  }
}