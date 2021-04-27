

part of 'widgets.dart';

class DetalleListado extends StatefulWidget {
  //const DetalleListado({Key key}) : super(key: key);
  
  @override
  _DetalleListadoState createState() => _DetalleListadoState();
}

class _DetalleListadoState extends State<DetalleListado> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(

        children: [
          Text('Auto'),
          _textAutoCompletar(),
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
      onSuggestionSelected: (suggestion) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductoDetallePage(product: suggestion)
        ));
      },

      noItemsFoundBuilder: (context) => 
        Container(
          height: 100,
          child: Center(
            child: Text(
              'No Users Found.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),

    );
  }


}


