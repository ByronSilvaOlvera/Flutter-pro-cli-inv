
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:fltestadobloc/models/producto.dart';
import 'package:fltestadobloc/models/response-get-entidad.dart';
import 'package:fltestadobloc/global/enviroment.dart';

class ProductoServices with ChangeNotifier {

  final hostService = '${Environment.apiUrl}/producto';


  static Future<List<Producto>> autoCompletarEntidad(String textobusqueda ) async {
    try {
      final hostServices = '${Environment.apiUrl}/producto';
      final uri = Uri.parse('$hostServices/get') ;
      final resp = await http.get(uri , 
            headers: {
              'Content-type' : 'application/json',       
            });
      

      if (resp.statusCode == 200) {
        final response = EntidadResponse.fromJson( json.decode(resp.body) );
        final List entidad = json.decode(json.encode(response.entidad));
        // print(entidad);
        // print(resp.body);
        // print(json.encode(response.entidad));
        return entidad.map((json) => Producto.fromJson(json)).where( (pro) {
          final nameLower = pro.nombre.toLowerCase();
          final queryLower = textobusqueda.toLowerCase();

          return nameLower.contains(queryLower);
        }).toList(); 

      }else{
        return null;
      }

    } catch (e) {
      print('Servcio Producto error $e');
      return null;
    }
  }

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
      print('Error Servicio Producto $e');
      return EntidadResponse(ok: false);
    }
  }

  Future<EntidadResponse> editEntidad( Producto entidad ) async {
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
      print('Error servicio Producto $e');
      return null;
    }
  }

  Future<Producto> getEntidadOne( String id ) async {
    try {
      final uri = Uri.parse('$hostService/getone') ;
      final resp = await http.post(uri, body: jsonEncode({"id" : id}),
      headers: {
        'Content-Type' : 'application/json'
      });

      final entidadResponse = EntidadResponse.fromJson( json.decode (resp.body) );
      if( resp.statusCode == 200){
             
        return productoFromJson( json.encode( entidadResponse.entidad ) ).first;        

      }else if( resp.statusCode == 404 ){
        print(entidadResponse.msg);
        return null;
      
      }else{
        print(entidadResponse.msg);
        return null ; 

      }
    } catch (e) {
      print('Error Servicio Producto $e');
      return null;
    }
  }

  Future<List<Producto>> getEntidad( ) async {
    try {
      final uri = Uri.parse('$hostService/get') ;
      final resp = await http.get(uri , 
            headers: {
              'Content-type' : 'application/json',       
            });
      
      final response = EntidadResponse.fromJson( json.decode(resp.body) );      
      if( response.ok ){
        final jsonResp = response.entidad ;
        return productoFromJson( json.encode( jsonResp )  );      
      }else{
        return null;
      }
    } catch (e) {
      print('Error Servcio Proveedor $e');
      return null;
    }
  }

  Future<EntidadResponse> createEntidad( Producto entidad ) async {
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
      print('Error Servcio Proveedor $e');
      return EntidadResponse(ok: false , msg :'Error de Conectividad');
    }
  }

}