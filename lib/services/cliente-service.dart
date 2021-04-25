
import 'dart:convert';
import 'package:fltestadobloc/models/response-get-entidad.dart';
import 'package:flutter/material.dart';

import 'package:fltestadobloc/models/cliente.dart';
import 'package:http/http.dart' as http;

import 'package:fltestadobloc/global/enviroment.dart';

class ClienteServices with ChangeNotifier {
  final hostService = '${Environment.apiUrl}/cliente';
  Future<bool> editCliente( Cliente entidad ) async {
    try {
      final uri = Uri.parse('$hostService/edit') ;
      final resp = await http.post(uri, body: jsonEncode(entidad) ,
      headers: {
        'Content-Type' : 'application/json'
      });
      final clienteResponse = EntidadResponse<Cliente>.fromJson( json.decode(resp.body) );
      return clienteResponse.ok;
    } catch (e) {
      print('Error servicio CLiente $e');
      return null;
    }
  }


  Future<Cliente> getClienteOne( String id ) async {
    try {
      final uri = Uri.parse('$hostService/one') ;
      final resp = await http.post(uri, body: jsonEncode({id : id}),
      headers: {
        'Content-Type' : 'application/json'
      });
      final clienteResponse = clienteFromJson(resp.body);
      if( resp.statusCode == 200){
        return clienteResponse;
      }
      return null ; 
    } catch (e) {
      print('Error Servcio Cliente $e');
      return null;
    }
  }

  Future<List<Cliente>> getCliente( Cliente entidad ) async {
    try {
      final uri = Uri.parse('$hostService/get') ;
      final resp = await http.get(uri , 
            headers: {
              'Content-type' : 'application/json',       
            });
      //final clienteResponse = clienteFromJson(resp.body);
      final clienteResponse = EntidadResponse<Cliente>.fromJson( json.decode(resp.body) );
      if( clienteResponse.ok){
        return clienteResponse.entidad;
      }
       return null;
    } catch (e) {
      print('Error Servcio Cliente $e');
      return null;
    }
  }

  Future<EntidadResponse> addCliente( Cliente entidad ) async {
    try {
      final uri = Uri.parse('$hostService/add') ;
      final resp = await http.post(uri, body: jsonEncode(entidad) , 
      headers: {
        'Content-Type' : 'application/json'
      });
      
      final clienteResponse = EntidadResponse<Cliente>.fromJson( json.decode(resp.body) );
      
      if(resp.statusCode == 200 ){
        if( clienteResponse.ok ){
          return EntidadResponse(ok: true);
        }
        else{          
          return EntidadResponse(ok: false, msg: 'Error Servicio Web');
        }
      }else if( resp.statusCode == 404 ){
        return EntidadResponse( ok: false , msg: clienteResponse.msg );
      }else{
        return EntidadResponse(ok: false , msg :'Error de Conectividad');
      }
    } catch (e) {
      print('Error Servcio Cliente $e');
      return EntidadResponse(ok: false , msg :'Error de Conectividad');
    }
  }

}