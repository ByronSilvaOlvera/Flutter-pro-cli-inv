
import 'dart:convert';
import 'package:fltestadobloc/models/response-get-entidad.dart';
import 'package:flutter/material.dart';

import 'package:fltestadobloc/models/cliente.dart';
import 'package:http/http.dart' as http;

import 'package:fltestadobloc/global/enviroment.dart';

class ClienteServices with ChangeNotifier {

  Future<List<Cliente>> getCliente( Cliente entidad ) async {
    try {
      final uri = Uri.parse('${Environment.apiUrl}/cliente/get') ;
      final resp = await http.get(uri , 
            headers: {
              'Content-type' : 'application/json',       
            });
      //final clienteResponse = clienteFromJson(resp.body);
      final clienteResponse = EntidadResponse<Cliente>.fromJson( json.decode(resp.body) );
      return clienteResponse.entidad;

    } catch (e) {
      return null;
    }
  }

  Future<bool> addCliente( Cliente entidad ) async {
    try {
      final uri = Uri.parse('${Environment.apiUrl}/cliente/add') ;
      final resp = await http.post(uri, body: jsonEncode(entidad) , 
      headers: {
        'Content-Type' : 'application/json'
      });
      
      if(resp.statusCode == 200 ){
        
        return true;
      }else{
        return false;
      }
    } catch (e) {
      return false;
    }
  }

}