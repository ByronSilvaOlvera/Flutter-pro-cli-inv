

part of 'widgets.dart';

class DetalleListado extends StatefulWidget {
  //const DetalleListado({Key key}) : super(key: key);
  
  @override
  _DetalleListadoState createState() => _DetalleListadoState();
}

class _DetalleListadoState extends State<DetalleListado> {
  
  List<Producto> productos  = [];
  Producto _productoSeleccinado = new Producto(nombre: '');
  String _busqueda;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text('Auto'),
          _textAutoCompletar(),
          Expanded(
            child: _panelSeleccion(),
          ),
          Expanded(
            child : _mostrarProductos(),
          )  
        ],
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
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => ProductoDetallePage(product: suggestion)
        // ));
        // 
        _productoSeleccinado = suggestion;
        productos = await ProductoServices.autoCompletarEntidad(_busqueda);
        setState(() {});
      },

      noItemsFoundBuilder: (context) => 
        Container(
          height: 100,
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
        children: [
          ListTile(
            leading: Icon(Icons.map),
            title: Text( _productoSeleccinado.nombre ),
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
          height: 50,
          color: Colors.amber,
          child: Center(child: Text('Producto ${productos[index].nombre}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }


}


