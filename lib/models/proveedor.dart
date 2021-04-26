// To parse this JSON data, do
//
//     final proveedor = proveedorFromJson(jsonString);

import 'dart:convert';

List<Proveedor> proveedorFromJson(String str) => List<Proveedor>.from(json.decode(str).map((x) => Proveedor.fromJson(x)));

String proveedorToJson(List<Proveedor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Proveedor {
    Proveedor({
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

    factory Proveedor.fromJson(Map<String, dynamic> json) => Proveedor(
        nombre        : json["nombre"],
        apellido      : json["apellido"],
        identificacion: json["identificacion"],
        direccion     : json["direccion"],
        correo        : json["correo"],
        uid           : json["uid"],
        estadoregistro: json["estadoregistro"],
    );

    Map<String, dynamic> toJson() => {
        "nombre"        : nombre,
        "apellido"      : apellido,
        "identificacion": identificacion,
        "direccion"     : direccion,
        "correo"        : correo,
        "uid"           : uid,
        "estadoregistro":  estadoregistro,

    };
}
