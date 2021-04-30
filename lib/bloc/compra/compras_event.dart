part of 'compras_bloc.dart';

@immutable
abstract class ComprasEvent {}



//Event actulizar sumas
class ActualizarTotales extends ComprasEvent {

}

//Evento Agregar Datos Proveedor
class AddDatosProveedor extends ComprasEvent{
  final DatosDocumento datosDocumento;
  AddDatosProveedor( this.datosDocumento );
}


//Eventos Agregar detalle
class AgregarDetalle extends ComprasEvent{
  final Detalle detalleCompra;
  AgregarDetalle( this.detalleCompra );
} 

//Eventos Agregar detalle
class DeleteDetalle extends ComprasEvent{} 



//Event 
class CrearCompra extends ComprasEvent { 
  final Compra compra;
  CrearCompra( this.compra );
}

//Eventos Delete
class BorrarCompra extends ComprasEvent{}