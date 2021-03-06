import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fltestadobloc/models/compra.dart';
import 'package:meta/meta.dart';

part 'compras_event.dart';
part 'compras_state.dart';

class CompraBloc extends Bloc<ComprasEvent, CompraState> {
  
  CompraBloc() : super( CompraState() );

  @override
  Stream<CompraState> mapEventToState( ComprasEvent event, ) async* {
     
    if( event is CrearCompra ){
      print(event.compra);
      print( 'Event ' );
      yield state.copyWith( compra: event.compra );
    
    }else if( event is BorrarCompra ){  
      yield state.estadoInicial();

    }


  }
}
