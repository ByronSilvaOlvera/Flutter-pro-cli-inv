

part of '../widgets.dart';

class DatosIdentidad extends StatefulWidget {
  final ColorDetalle operacion;
  final DatosDocumento datosIdentidad;
  DatosIdentidad( { @required this.operacion , this.datosIdentidad}  );

  @override
  _DatosIdentidadState createState() => _DatosIdentidadState();
}

class _DatosIdentidadState extends State<DatosIdentidad> {
  ColorDetalle _config = new ColorDetalle();


  @override
  void initState() {

    super.initState();
     _config = widget.operacion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de operacion ${ _config.titulos.titulobar }'),
        backgroundColor: _config.appbarcolor ,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height  ,
        color: _config.fondocolor, // fondo
        padding: EdgeInsets.all(10.0), 
        transformAlignment: Alignment.center ,   
        child: SingleChildScrollView(
          child: Center(child: _datosDocumento(context), heightFactor: 1.3 ,),
        ),
      ),
    );
  }

  Widget _botonesAction(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          iconSize: 30.0 ,
          color: _config.saveiconcolor,
          focusColor: Colors.blue,
          padding: EdgeInsets.all(25),
          splashRadius: 30,
          icon: Icon(Icons.save_alt , ), 
          //ENVIAR DATA
          onPressed: ()=> _devolverDatos()
        ),
        SizedBox(width: 15.0 ,),
        IconButton(
          iconSize: 30.0 ,            
          splashRadius: 30.0 ,
          color: _config.fechacoloriconbtn,
          padding: EdgeInsets.all(25),
          icon: Icon(Icons.close , ), 
          /// SALIR
          onPressed: ()=> Navigator.of(context).pop(),
        ),
        
      ],
    );
  }


  void _devolverDatos(){
    if( proveedorCtrl.text.isEmpty || 
        autorizacionCtrl.text.isEmpty ||
        documentoNumCtrl.text.isEmpty ){
          ScaffoldMessenger.of(context).showSnackBar(  
            MsgSnackBar(msg: "Complete la Información", tipo: 0,).build(context)
          );
          return null;
        }else{
          Navigator.of(context).pop( DatosDocumento(
            nombre      : proveedorCtrl.text,
            autorizacion: autorizacionCtrl.text,
            documento   : documentoNumCtrl.text,
            fecha       : _fecha
          ));
        }
  }

  Widget _datosDocumento(BuildContext context){
    return Container(      
      color: _config.fondocolor  , // fondo
      padding: EdgeInsets.all(15.0),
      child: Card(
        elevation: 10.0 ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
              children: [

                ListTile(
                  leading: Container( 
                    child  : Icon(Icons.description_outlined, size: 25 , 
                      color: _config.iconcolor , 
                    ), 
                    padding: EdgeInsets.all(10.00), 
                  ) ,
                  title: Text(_config.titulos.tituloone),
                  subtitle: Text(_config.titulos.titulotwo),
                ),

                SizedBox(
                  height: 70.0 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft    : Radius.circular(32) ,
                            bottomLeft : Radius.circular(32) ,
                            bottomRight: Radius.circular(32) ,
                            topRight   :  Radius.circular(32) ,
                          ),
                          child: Container(
                            color : _config.fechacolor, // fecha color Colors.red[100] ,
                            child: ListTile(                        
                              leading: Container(
                                padding:EdgeInsets.symmetric(vertical: 10.00, horizontal: 4.0),
                                child: Icon(Icons.today_outlined, 
                                  color: _config.fechacoloricon),
                              ) ,
                              title  : Text('F e c h a'  , 
                                  style: TextStyle(color: _config.fechacoloricon, fontSize: 12.0 )
                              ),
                              subtitle: Text( DateFormat('yyyy-MMM-dd').format(_fecha)  , 
                                  style: TextStyle(color: _config.fechacoloricon, fontSize: 20.0 ),
                              ),
                            ),
                          ),
                        )
                      ),
                      SizedBox( width: 20.0,),
                      IconButton(
                        padding: EdgeInsets.all(20.0),
                        splashRadius: 35.0,
                        icon: Icon(Icons.calendar_today, color: _config.fechacoloriconbtn  ,) , 
                        onPressed: () => _selectDate(context) , //() => {}
                      ),
                      

                    ],
                  ),
                ),
                
                SizedBox(height: 18.0,),
                            
                _busquedaIdentidad(),

                SizedBox(height: 18.0,),
                
                TextField(
                  obscureText: false,
                  controller: documentoNumCtrl ,
                  keyboardType: TextInputType.numberWithOptions( signed: true ) ,
                  decoration: InputDecoration(
                    icon     : Icon(Icons.article , color:  _config.iconcolor ),
                    border   : OutlineInputBorder(),
                    labelText: 'Numero Documento',
                  ),
                ),

                SizedBox(height: 18.0,),

                TextField(
                  obscureText: false,
                  controller: autorizacionCtrl ,
                  keyboardType: TextInputType.number ,
                  decoration: InputDecoration(
                    icon     : Icon(Icons.qr_code , color:  _config.iconcolor ),
                    border   : OutlineInputBorder(),
                    labelText: 'Autorizacion',
                  ),
                ),

                _botonesAction(),

              ],
          ),
        ),
      ),
    );
  }

  //######## DATEPCKER #################

  DateTime _fecha = DateTime.now();

  Future _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context    : context,
        initialDate: new DateTime.now(),
        firstDate  : new DateTime(2016),
        lastDate   : new DateTime(2025)
    );
    if(picked != null) {setState(() => _fecha = picked); setState((){}); }
    
  }


  //########### TEXTINPUT PROVEEDOR ###################
   final proveedorCtrl    = TextEditingController( text: "" );
   final autorizacionCtrl = TextEditingController( text: "" );
   final documentoNumCtrl = TextEditingController( text: "" );
   
  Widget _busquedaIdentidad(){
    return TypeAheadField<Proveedor>(
      hideSuggestionsOnKeyboardHide: false,
      textFieldConfiguration: TextFieldConfiguration(
        controller  :  proveedorCtrl,
        decoration  : InputDecoration(
          prefixIcon: Icon(Icons.search, color: _config.iconcolor ),
          border    : OutlineInputBorder(),
          hintText  : 'Proveedor',
        ),
      ),
      // trae la data
      suggestionsCallback: (pattern) async {
        
        return await ProveedorServices.autoCompletarEntidad(pattern);
      } ,

      //devuelve combo box datos
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading : Icon(Icons.person_pin_circle_outlined),
          title   : Text(suggestion.nombre),
          subtitle: Text('\$${suggestion.nombre}'),
        );
      },

      // Quiero mover al una pagina
      onSuggestionSelected: (suggestion) async  {     
        proveedorCtrl.text =  suggestion.nombre;   
        
        //setState(() {});
      },

      noItemsFoundBuilder: (context) => 
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          height: 80,
          child: Center(
            child: Text(
              'Productos no Encontrado.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),

    );
  }



}