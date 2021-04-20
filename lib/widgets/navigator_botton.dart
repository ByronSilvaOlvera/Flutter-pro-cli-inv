
part of 'widgets.dart';

class NavigationBotton extends StatefulWidget {
  @override
  _NavigationBottonState createState() => _NavigationBottonState();
}

class _NavigationBottonState extends State<NavigationBotton> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          _itemBtnNavigator(Icon(Icons.home)  , 'Home'),
          _itemBtnNavigator(Icon(Icons.account_circle_sharp), 'Cliente'),
          _itemBtnNavigator(Icon(Icons.add_shopping_cart_sharp), 'Producto'),
          _itemBtnNavigator(Icon(Icons.build_circle_outlined), 'Inventario'),
                  
        ],
        
      )
    );
  }

  BottomNavigationBarItem _itemBtnNavigator(Icon icon, String name){
    return BottomNavigationBarItem(
      icon: icon,
      label: name,
      backgroundColor: Colors.amberAccent,

    );
  }
}