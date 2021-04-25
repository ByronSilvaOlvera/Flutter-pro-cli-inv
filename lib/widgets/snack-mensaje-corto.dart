

part of 'widgets.dart';


class MsgSnackBar extends StatelessWidget {
  
  final double tipo;
  final String msg;

  const MsgSnackBar( 
    { Key key, 
      this.tipo, 
      this.msg } ) : super(key: key);

  @override
  SnackBar build(BuildContext context) {    
    // Danger
    if( tipo == 0){
      return _mensajeBotton(context, Colors.red, Icons.error, msg);
    // success
    }else if( tipo == 1){
      return _mensajeBotton(context, Colors.greenAccent, Icons.done, msg);
    // info
    }else{
      return _mensajeBotton(context, Colors.blueAccent, Icons.info, msg);
    }
  }

  Widget _mensajeBotton(BuildContext context, Color color, IconData iconData,String msg ){
    return SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,                        
          children: [                          
            Text(msg),
            Icon(iconData, color : Colors.white ),          
          ],
        ),
        backgroundColor: color, //Colors.blueAccent.shade200,        
      );
  }


}