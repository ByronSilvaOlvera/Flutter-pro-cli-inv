
part of 'widgets.dart';



class TablaWidget extends StatelessWidget {
  

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
        label: Text('Id')
      ),
      DataColumn(
        label: Text('Nombre')
      ),
      DataColumn(
        label: Text('Cantidad')
      ),
      DataColumn(
        label: Text('Precio')
      ),
      DataColumn(
        label: Text('Valor')
      )
    ];
  }

  List<DataRow> _bodyData(){
    return <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('1')),
          DataCell(Text('Zapato')),
          DataCell(Text('5')),
          DataCell(Text('25.98')),
          DataCell(Text('129.90')),
        ]
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('1')),
          DataCell(Text('Blusa')),
          DataCell(Text('5')),
          DataCell(Text('25.98')),
          DataCell(Text('129.90')),
        ]
      )
    ];
  }

}