
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:fltestadobloc/models/response-get-entidad.dart';
import 'package:fltestadobloc/models/cliente.dart';
import 'package:fltestadobloc/global/enviroment.dart';

class ClienteServices with ChangeNotifier {

  final hostService = '${Environment.apiUrl}/cliente';

  Future<EntidadResponse> activarEntidad(String id, String  estado ) async {
    try {
      final uri = Uri.parse('$hostService/edit') ;
      final resp = await http.post(uri, body: jsonEncode({ "uid" : id , "estadoregistro" : estado }) ,
      headers: {
        'Content-Type' : 'application/json'
      });

      final response = EntidadResponse.fromJson( json.decode(resp.body) );
      if(resp.statusCode == 200 ){
        if( response.ok ){
          return EntidadResponse(ok: true); 
        }
        else{
          return EntidadResponse(ok: true, msg:  'Error Conectividad');
        }
      }
      else{
        return EntidadResponse(ok: false , msg :response.msg );
      }

    } catch (e) {
      print('Error Servicio Cliente $e');
      return EntidadResponse(ok: false);
    }
  }

  Future<EntidadResponse> editEntidad( Cliente entidad ) async {
    try {
      
      final uri = Uri.parse('$hostService/edit') ;
      final resp = await http.post(uri, body: jsonEncode(entidad) ,
      headers: {
        'Content-Type' : 'application/json'
      });

      final response = EntidadResponse.fromJson( json.decode(resp.body) );
      
      if( resp.statusCode == 200 ){
        if( response.ok ){
          return EntidadResponse(ok: true);
      
        }else{
          return EntidadResponse(ok: false , msg :'Error de Conectividad');
      
        }
      }else{
        return EntidadResponse(ok: false , msg :response.msg );
     
      }

    } catch (e) {
      print('Error servicio CLiente $e');
      return null;
    }
  }

  Future<Cliente> getEntidadOne( String id ) async {
    try {
      final uri = Uri.parse('$hostService/getone') ;
      final resp = await http.post(uri, body: jsonEncode({"id" : id}),
      headers: {
        'Content-Type' : 'application/json'
      });

      final entidadResponse = EntidadResponse.fromJson( json.decode (resp.body) );
      if( resp.statusCode == 200){
             
        return clienteFromJson( json.encode( entidadResponse.entidad ) );        

      }else if( resp.statusCode == 404 ){
        print(entidadResponse.msg);
        return null;
      
      }else{
        print(entidadResponse.msg);
        return null ; 

      }
    } catch (e) {
      print('Error Servcio Cliente $e');
      return null;
    }
  }

  Future<List<Cliente>> getEntidad( ) async {
    try {
      final uri = Uri.parse('$hostService/get') ;
      final resp = await http.get(uri , 
            headers: {
              'Content-type' : 'application/json',       
            });
      
      final response = EntidadResponse.fromJson( json.decode(resp.body) );      
      if( response.ok ){
        final jsonResp = { "clientes" : response.entidad };
        return clienteListaFromJson( json.encode( jsonResp )  ).clientes;      
      }else{
        return null;
      }
    } catch (e) {
      print('Error Servcio Cliente $e');
      return null;
    }
  }

  Future<EntidadResponse> createEntidad( Cliente entidad ) async {
    try {
      final uri = Uri.parse('$hostService/add') ;
      final resp = await http.post(uri, body: jsonEncode(entidad) , 
      headers: {
        'Content-Type' : 'application/json'
      });
      
      final entidadResponse = EntidadResponse.fromJson( json.decode(resp.body) );
      
      if(resp.statusCode == 200 ){
        if( entidadResponse.ok ){
          return EntidadResponse(ok: true);
        }
        else{          
          return EntidadResponse(ok: false, msg: 'Error Servicio Web');
        }
      }else if( resp.statusCode == 404 ){
        return EntidadResponse( ok: false , msg: entidadResponse.msg );
      }else{
        return EntidadResponse(ok: false , msg :'Error de Conectividad');
      }
    } catch (e) {
      print('Error Servcio Cliente $e');
      return EntidadResponse(ok: false , msg :'Error de Conectividad');
    }
  }

}