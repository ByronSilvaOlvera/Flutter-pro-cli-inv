import 'package:flutter/material.dart';
class InventarioPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _tablaKardex(),
    );
  }

  Widget _tablaKardex(){
    return DataTable(
      columns: _headerData(), 
      rows: _bodyData()
    );
  }

  List<DataColumn> _headerData(){
    return <DataColumn>[
      DataColumn(
        label: Text('Nombre')
      ),
      DataColumn(
        label: Text('Input')
      ),
      DataColumn(
        label: Text('Output')
      )
    ];
  }

  List<DataRow> _bodyData(){
    return <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Zapato')),
          DataCell(Text('Zapato')),
          DataCell(Text('Zapato')),
        ]
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Zapato')),
          DataCell(Text('Zapato')),
          DataCell(Text('Zapato')),
        ]
      )
    ];
  }

}