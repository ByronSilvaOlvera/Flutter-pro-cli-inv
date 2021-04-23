
import 'package:flutter/material.dart';
class InventarioPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children :  [
          _tituloInventario(),
          _seleccionProducto(),
          _tablaKardex(),
        ] 
      ) 
    );
  }

  Widget _tablaKardex(){
    return Scrollbar(
      isAlwaysShown: false,
      child: DataTable(
        columnSpacing: 10.0,
        dataRowHeight: 65.0,
        columns: _headerData(), 
        rows: _bodyData()
      ),
    );
  }

  List<DataColumn> _headerData(){
    return <DataColumn>[
      DataColumn(
        label: Text('#')
      ),
      DataColumn(
        label: Text('Descripcion')
      ),
      DataColumn(
        label: Text('Input')
      ),
      DataColumn(
        label: Text('Output')
      ),
      DataColumn(
        label: Text('Saldo')
      )
    ];
  }

  List<DataRow> _bodyData(){
    return <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('1')),
          DataCell(Text('Zapato')),
          DataCell(Text('100')),
          DataCell(Text('0')),
          DataCell(Text('100')),
        ]
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('2')),
          DataCell(Text('Zapato')),
          DataCell(Text('0')),
          DataCell(Text('30')),
          DataCell(Text('70')),
        ]
      )
    ];
  }

  Widget _tituloInventario(){
    return SizedBox(
      height: 40.0,
      child: Center(
        child: Text(
          'Inventario kardex'
        ),
      ) ,
    );
  }

  Widget _seleccionProducto(){
    return SizedBox(
      height: 80.0 ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
        children: [
          Center(child: Text( 'Selecciona un producto'),),
          CircleAvatar(
            backgroundColor: Colors.orange.shade100  ,
            radius: 30.0,

            child: IconButton(
              icon: Icon(Icons.add_shopping_cart_sharp), 
              hoverColor: Colors.green,
              color: Colors.orange,
              highlightColor: Colors.redAccent.shade100,
              visualDensity: VisualDensity.comfortable ,            
              onPressed: () => {},
            ),
          
          )
        ],
      ),
    );
  }

}