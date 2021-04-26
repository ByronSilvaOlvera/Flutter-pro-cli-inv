
import 'package:fltestadobloc/pages/list-pages/list-cliente.dart';
import 'package:flutter/material.dart';

class ListaOpcionesBar extends StatefulWidget {
  
  @override
  _ListaOpcionesBarState createState() => _ListaOpcionesBarState();
}

class _ListaOpcionesBarState extends State<ListaOpcionesBar> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(      
      child: Column(
        children: <Widget>[
          SizedBox(  
            height: 50.0,         
            child:TabBar(
              indicatorColor: Colors.red,              
              labelColor: Colors.orange,
              controller: _tabController,
              unselectedLabelColor: Colors.amber[500],
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.people_sharp),
                ),
                Tab(
                  icon: Icon(Icons.support_agent),
                ),
                Tab(
                  icon: Icon(Icons.inventory),
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                ),
                Tab(
                  icon: Icon(Icons.shopping_bag),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  <Widget>[
                Container(
                  child: ListadoCliente(),
                ),
                Center(
                  child: Text('two'),
                ),
                Center(
                  child: Text('three'),
                ),
                Center(
                  child: Text('four'),
                ),
                Center(
                  child: Text('five'),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}