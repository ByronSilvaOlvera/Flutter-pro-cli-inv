
import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid ? 'http://192.168.1.3:3004/api' : 'http://localhost:3004/api' ;
}