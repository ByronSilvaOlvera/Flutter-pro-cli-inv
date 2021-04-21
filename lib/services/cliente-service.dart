

import 'package:fltestadobloc/models/cliente.dart';
import 'package:http/http.dart' as http;

import 'package:fltestadobloc/global/enviroment.dart';

class ClienteServices {

  Future<bool> addCliente( Cliente entidad ) async {
    try {
      final uri = Uri.parse('${Environment.apiUrl}/cliente/add') ;
      final resp = await http.post(uri, body: entidad, 
      headers: {
        'Content-Type' : 'application/json'
      });
      
      if(resp.statusCode == 200 ){
        return true;
      }else{
        return true;
      }
    } catch (e) {
      return false;
    }
  }

}