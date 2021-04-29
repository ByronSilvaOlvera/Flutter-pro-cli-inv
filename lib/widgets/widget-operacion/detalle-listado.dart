

part of '../widgets.dart';

class DetalleListado extends StatefulWidget {
  //const DetalleListado({Key key}) : super(key: key);
  
  @override
  _DetalleListadoState createState() => _DetalleListadoState();
}

class _DetalleListadoState extends State<DetalleListado> {
  
  List<Producto> productos  = [];
  Producto _productoSeleccionado = new Producto(nombre: '');
  String _busqueda;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busqueda de articulos') ,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[

            _textAutoCompletar(),
            SizedBox( child : _panelSeleccion(), height: 60.0, width: 300.0,) ,
            Expanded( child : _mostrarProductos(),
            )  
          ],
        ),
      ),
    );
  }

  Widget _textAutoCompletar(){
    //final servProveedor = Provider.of<ProductoServices>( context, listen: false);
    return TypeAheadField<Producto>(
      hideSuggestionsOnKeyboardHide: false,
      textFieldConfiguration: TextFieldConfiguration(
        //autofocus: true,
        //style:  DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.italic),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: 'Buscar Productos',
        ),
      ),
      // trae la data
      suggestionsCallback: (pattern) async {
        _busqueda = pattern;
        print(_busqueda);
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
        _productoSeleccionado = suggestion;
        productos = await ProductoServices.autoCompletarEntidad(_busqueda);
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

  Widget _panelSeleccion(){
   // return Container(
    return  ListView(
      padding: EdgeInsets.all(0.0) ,
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: [
              Expanded(
                child : ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading       : Icon(_productoSeleccionado.nombre.isEmpty ? Icons.search_off : Icons.category_outlined ),
                  title         : Text( _productoSeleccionado.nombre.isEmpty ? 'Selecctor vacia' : _productoSeleccionado.nombre ),
                ),
              ),
              
              IconButton(icon: Icon(Icons.done_outline), onPressed: ()=> {})
              
            ],
          )
        ],
      );
      
    //);
  }

  Widget _mostrarProductos(){
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: productos.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 70,
          padding: EdgeInsets.all(5.0),
          color: Colors.amber.shade50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children : [
              Expanded(

              child :ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0.0 , horizontal: 5.0 ),
                title   : Text(productos[index].nombre) ,
                subtitle: Text(productos[index].presentacion),
              ),              
              ),
              IconButton(icon: Icon(Icons.add_circle_outline ), onPressed: ()=> {} , alignment: Alignment.centerRight,)
            ]
          )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }


}


