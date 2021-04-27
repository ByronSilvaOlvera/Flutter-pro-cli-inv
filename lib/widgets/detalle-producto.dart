


part of 'widgets.dart';



class ProductoDetallePage extends StatelessWidget {
  final Producto product;

  const ProductoDetallePage({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(product.nombre),
        ),
        body: ListView(
          children: [
            // Image.network(
            //   user.imageUrl,
            //   height: 300,
            //   fit: BoxFit.cover,
            // ),
            Icon( Icons.inventory ),
            SizedBox(height: 16),
            Text(
              product.nombre,
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
}