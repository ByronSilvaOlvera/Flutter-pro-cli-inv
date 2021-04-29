

part of '../widgets.dart';

class ProductoOperacion extends StatefulWidget {
  
  @override
  _ProductoOperacionState createState() => _ProductoOperacionState();
}

class _ProductoOperacionState extends State<ProductoOperacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de operacion'),
        backgroundColor: Colors.red[400] ,
      ),
      body: Container( 
        padding: EdgeInsets.all(10.0),      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              _datosDocumento(context),

              _botonesAction(),

            ],
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
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: [

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
                icon     : Icon(Icons.article),
                border   : OutlineInputBorder(),
                labelText: 'Numero Documento',
              ),
            ),

            SizedBox(height: 18.0,),

            TextField(
              obscureText: false,
              //controller: nombreCtrl,
              decoration: InputDecoration(
                icon     : Icon(Icons.qr_code),
                border   : OutlineInputBorder(),
                labelText: 'Autorizacion',
              ),
            ),

          ],
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
          prefixIcon: Icon(Icons.search),
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