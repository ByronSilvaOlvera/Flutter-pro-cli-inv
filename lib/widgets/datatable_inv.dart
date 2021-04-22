
part of 'widgets.dart';



class TablaWidget extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  _tablaKardex(context),
      
    );
  }

   Widget _tablaKardex(BuildContext context){
    return DataTable(
      columnSpacing: 10.0,
      dataRowHeight: 65.0,
      dataRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected))
          return Theme.of(context).colorScheme.primary.withOpacity(0.08);
        return null;  // Use the default value.
      }),
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
          DataCell(Text('Zapato de loma ')),
          DataCell(Text('5')),
          DataCell(Text('25.98')),
          DataCell(Text('129.90')),
        ]
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('1')),
          DataCell(Text('Blusa navideña ')),
          DataCell(Text('5')),
          DataCell(Text('25.98')),
          DataCell(Text('129.90')),
        ]
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('1')),
          DataCell(Text('Blusa de sol para los lunes para el frio y los de la oficina')),
          DataCell(Text('5')),
          DataCell(Text('25.98')),
          DataCell(Text('129.90')),
        ]
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('1')),
          DataCell(Text('Blusa navideña ')),
          DataCell(Text('5')),
          DataCell(Text('25.98')),
          DataCell(Text('129.90')),
        ]
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('1')),
          DataCell(Text('Blusa navideña ')),
          DataCell(Text('5')),
          DataCell(Text('25.98')),
          DataCell(Text('129.90')),
        ]
      ),
    ];
  }

}