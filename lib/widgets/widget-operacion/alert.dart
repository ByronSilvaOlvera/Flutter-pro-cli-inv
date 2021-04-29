

  // void _mostrarAlerta(BuildContext context){
  //   DateTime f = _fecha;
  //   showDialog(
  //     context: context, 
  //     builder: (context){
  //       return AlertDialog(
  //         contentPadding : EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 24.0),
  //         insetPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0) ,
  //         scrollable: true,
  //         title: Text('Titulo'),
  //         content: StatefulBuilder(
  //           builder: (BuildContext context, StateSetter setState){

  //           //}
  //            return Column(
  //             children: [

  //               SizedBox(
  //                 height: 70.0 ,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [

  //                     Expanded(
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.only(
  //                           topLeft    : Radius.circular(32) ,
  //                           bottomLeft : Radius.circular(32) ,
  //                           bottomRight: Radius.circular(32) ,
  //                           topRight   :  Radius.circular(32) ,
  //                         ),
  //                         child: Container(
  //                           color : Colors.red[100] ,
  //                           child: ListTile(                        
  //                             leading: Icon(Icons.calendar_view_day, 
  //                               color: Colors.red.shade900) ,
  //                             title  : Text( f.toString(), 
  //                                 style: TextStyle(color: Colors.red.shade900 )
  //                             ),
  //                           ),
  //                         ),
  //                       )
  //                     ),
  //                     SizedBox( width: 20.0,),
  //                     IconButton(
  //                       padding: EdgeInsets.all(20.0),
  //                       splashRadius: 35.0,
  //                       icon: Icon(Icons.calendar_today, color: Colors.red ,) , 
  //                       onPressed: ()  => {   _selectDate(context).then((value) => {setState((){}) } ), setState(() {}) }, //() => {}
  //                     ),
  //                   ],
  //                 ),
  //               ),
                
  //               SizedBox(height: 18.0,),
                            
  //               _busquedaIdentidad(),

  //               SizedBox(height: 18.0,),
                
  //               TextField(
  //                 obscureText: false,
  //                 //controller: nombreCtrl,
  //                 decoration: InputDecoration(
  //                   icon     : Icon(Icons.article),
  //                   border   : OutlineInputBorder(),
  //                   labelText: 'Numero Documento',
  //                 ),
  //               ),
                
  //               SizedBox(height: 18.0,),

  //               TextField(
  //                 obscureText: false,
  //                 //controller: nombreCtrl,
  //                 decoration: InputDecoration(
  //                   icon     : Icon(Icons.qr_code),
  //                   border   : OutlineInputBorder(),
  //                   labelText: 'Autorizacion',
  //                 ),
  //               ),
  //             ],
  //           );
  //           //setState(() {});
  //           } 
  //         ), 
        
  //         actions: [
  //           IconButton(
  //             iconSize: 30.0 ,
  //             color: Colors.amber,
  //             focusColor: Colors.blue,
  //             padding: EdgeInsets.all(25),
  //             splashRadius: 30,
  //             icon: Icon(Icons.save_alt , ), 
  //             onPressed: ()=>{}
  //           ),

  //           IconButton(
  //             iconSize: 30.0 ,            
  //             splashRadius: 30.0 ,
  //             color: Colors.red,
  //             padding: EdgeInsets.all(25),
  //             icon: Icon(Icons.close , ), 
  //             onPressed: ()=> Navigator.of(context).pop() ,
  //           ),

           
           

  //         ],
        
  //       );
  //     } 
  //   );
  // }