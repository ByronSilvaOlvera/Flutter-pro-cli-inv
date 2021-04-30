

part of '../widgets.dart';


class ProductoOperacion extends StatefulWidget {

  final ColorDetalle operacion;
  ProductoOperacion( { @required this.operacion }  );

  @override
  _ProductoOperacionState createState() => _ProductoOperacionState();
}

class _ProductoOperacionState extends State<ProductoOperacion> {
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
        title: Text('Detalle operacion ${ _config.titulos.titulobar }'),
        backgroundColor: _config.appbarcolor, //== null ? Colors.red[400]
      ),
      body: Container(
        height: MediaQuery.of(context).size.height  ,
        color: _config.fondocolor , //Colors.red[50] 
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
          color: _config.saveiconcolor, // Colors.amber,
          focusColor: Colors.blue,
          padding: EdgeInsets.all(25),
          splashRadius: 30,
          icon: Icon(Icons.save_alt , ), 
          onPressed: ()=>{}
        ),
        SizedBox(width: 15.0 ,),
        IconButton(
          iconSize: 30.0 ,            
          splashRadius: 30.0 ,
          color: _config.fechacoloriconbtn, // Colors.red,
          padding: EdgeInsets.all(25),
          icon: Icon(Icons.close , ), 
          onPressed: ()=>{} ,
        ),
        
      ],
    );
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
                    color: _config.iconcolor , ), // Colors.redAccent
                    padding: EdgeInsets.all(10.00), 
                  ) ,
                  title: Text( _config.titulos.tituloone ),
                  subtitle: Text(_config.titulos.titulotwo ),
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
                            color : _config.fechacolor , // fondo Colors.red[100] ,
                            child: ListTile(                        
                              leading: Container(
                                padding:EdgeInsets.symmetric(vertical: 10.00, horizontal: 4.0),  
                                child: Icon(Icons.dashboard_customize, 
                                  color: _config.fechacoloricon ), // Colors.red.shade900
                              ) ,
                              title  : Text( 'D o c u m e n t o '  , 
                                  style: TextStyle(color: _config.fechacoloricon, fontSize: 12.0 ),
                              ),
                              subtitle: Text('001-001-123456789'  , 
                                  style: TextStyle(color: _config.fechacoloricon, fontSize: 16.0 ),
                              ),
                            ),
                          ),
                        )
                      ),
                      SizedBox( width: 20.0,),
                      IconButton(
                        padding: EdgeInsets.all(20.0),
                        splashRadius: 35.0,
                        icon: Icon(Icons.table_view_sharp, color: _config.fechacoloriconbtn ,) , 
                        onPressed: () => {} , //() => {} _selectDate(context)
                      ),
                      

                    ],
                  ),
                ),
                
                SizedBox(height: 18.0,),
                            
                _busquedaIdentidad(),

                SizedBox(height: 18.0,),
                
                TextField(
                  //controller: nombreCtrl,
                  obscureText: false,
                  keyboardType: TextInputType.number ,
                  textAlign: TextAlign.right ,
                  decoration: InputDecoration(
                    icon     : Icon(Icons.tag , color: _config.iconcolor ), // Colors.redAccent
                    border   : OutlineInputBorder(),
                    labelText: 'Cantidad ',
                    
                  ),
                ),

                SizedBox(height: 18.0,),

                TextField(
                  //controller: nombreCtrl,
                  obscureText: false,
                  textAlign: TextAlign.right ,                  
                  keyboardType: TextInputType.number ,
                  decoration: InputDecoration(
                    icon     : Icon(Icons.monetization_on_outlined , color: _config.iconcolor ),
                    border   : OutlineInputBorder(),
                    labelText: 'Costo',
                  ),
                ),

                _botonesAction(),

              ],
          ),
        ),
      ),
    );
  }

 

  Widget _busquedaIdentidad(){
    return TypeAheadField<Producto>(
      hideSuggestionsOnKeyboardHide: false,
      textFieldConfiguration: TextFieldConfiguration(
        //autofocus: true,
        //style:  DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.italic),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: _config.iconcolor ),
          border: OutlineInputBorder(),
          hintText: 'Producto',
        ),
      ),
      // trae la data
      suggestionsCallback: (pattern) async {

        return await ProductoServices.autoCompletarEntidad(pattern);
      } ,

      //devuelve combo box datos
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(suggestion.nombre),
          subtitle: Text('\$${suggestion.nombre}'),
        );
      },

      // Quiero mover al una pagina
      onSuggestionSelected: (suggestion) async {        
        setState(() {});
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