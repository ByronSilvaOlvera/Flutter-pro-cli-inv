// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
    Cliente({
        this.nombre,
        this.apellido,
        this.identificacion,
        this.direccion,
        this.correo,
    });

    String nombre;
    String apellido;
    String identificacion;
    String direccion;
    String correo;

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        nombre: json["nombre"],
        apellido: json["apellido"],
        identificacion: json["identificacion"],
        direccion: json["direccion"],
        correo: json["correo"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "identificacion": identificacion,
        "direccion": direccion,
        "correo": correo,
    };
}
