part of 'compras_bloc.dart';

class CompraState {
  final bool compraIniciada;
  final Compra compra;

  CompraState({Compra entrada }) : compra = entrada ?? null ,
    compraIniciada = ( entrada != null ) ? true : false;

}

