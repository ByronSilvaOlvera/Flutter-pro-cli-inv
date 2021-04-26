// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';


ClienteLista clienteListaFromJson(String str) => ClienteLista.fromJson(json.decode(str));

String clienteListaToJson(ClienteLista data) => json.encode(data.toJson());

class ClienteLista {
    ClienteLista({
        this.clientes,
    });

    List<Cliente> clientes;

    factory ClienteLista.fromJson(Map<String, dynamic> json) => ClienteLista(
        clientes: List<Cliente>.from(json["clientes"].map((x) => Cliente.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "clientes": List<dynamic>.from(clientes.map((x) => x.toJson())),
    };

    
}



Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
    Cliente({
        this.nombre,
        this.apellido,
        this.identificacion,
        this.direccion,
        this.correo,
        this.uid,
        this.estadoregistro,
    });

    String nombre;
    String apellido;
    String identificacion;
    String direccion;
    String correo;
    String uid;
    String estadoregistro;
   

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        nombre: json["nombre"],
        apellido: json["apellido"],
        identificacion: json["identificacion"],
        direccion: json["direccion"],
        correo: json["correo"],
        uid :json["uid"],
        estadoregistro :json["estadoregistro"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "identificacion": identificacion,
        "direccion": direccion,
        "correo": correo,
        "uid": uid,
        "estadoregistro": estadoregistro,
    };
}
