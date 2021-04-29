

part of '../widgets.dart';

class DatosIdentidad extends StatefulWidget {
  //const DatosIdentidad({Key key}) : super(key: key);

  @override
  _DatosIdentidadState createState() => _DatosIdentidadState();
}

class _DatosIdentidadState extends State<DatosIdentidad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de operacion'),
        backgroundColor: Colors.red[400] ,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height  ,
        color: Colors.red[50] ,
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
          color: Colors.amber,
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
          color: Colors.red,
          padding: EdgeInsets.all(25),
          icon: Icon(Icons.close , ), 
          onPressed: ()=>{} ,
        ),
        
      ],
    );
  }

  Widget _datosDocumento(BuildContext context){
    return Container(      
      color: Colors.red[50]  ,
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
                    child  : Icon(Icons.description_outlined, size: 25 , color: Colors.redAccent , ), 
                    padding: EdgeInsets.all(10.00), 
                  ) ,
                  title: Text('Documento '),
                  subtitle: Text('Datos Generales'),
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
                            color : Colors.red[100] ,
                            child: ListTile(                        
                              leading: Icon(Icons.calendar_view_day, 
                                color: Colors.red.shade900) ,
                              title  : Text(_fecha.toUtc().toString() , 
                                  style: TextStyle(color: Colors.red.shade900 )
                              ),
                            ),
                          ),
                        )
                      ),
                      SizedBox( width: 20.0,),
                      IconButton(
                        padding: EdgeInsets.all(20.0),
                        splashRadius: 35.0,
                        icon: Icon(Icons.calendar_today, color: Colors.red ,) , 
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
                  //controller: nombreCtrl,
                  decoration: InputDecoration(
                    icon     : Icon(Icons.article , color: Colors.redAccent ),
                    border   : OutlineInputBorder(),
                    labelText: 'Numero Documento',
                  ),
                ),

                SizedBox(height: 18.0,),

                TextField(
                  obscureText: false,
                  //controller: nombreCtrl,
                  decoration: InputDecoration(
                    icon     : Icon(Icons.qr_code , color: Colors.redAccent ),
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

  Widget _busquedaIdentidad(){
    return TypeAheadField<Producto>(
      hideSuggestionsOnKeyboardHide: false,
      textFieldConfiguration: TextFieldConfiguration(
        //autofocus: true,
        //style:  DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.italic),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.redAccent),
          border: OutlineInputBorder(),
          hintText: 'Proveedor',
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