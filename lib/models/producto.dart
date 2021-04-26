
// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';

List<Producto> productoFromJson(String str) => List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

String productoToJson(List<Producto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
    Producto({
        this.estadoregistro,
        this.nombre,
        this.presentacion,
        this.unidad,
        this.descripcion,
        this.uid,
        //this.createdAt,
        //this.updatedAt,
    });

    String estadoregistro;
    String nombre;
    String presentacion;
    int unidad;
    String descripcion;
    String uid;
    //DateTime createdAt;
    //DateTime updatedAt;

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        estadoregistro: json["estadoregistro"],
        nombre        : json["nombre"],
        presentacion  : json["presentacion"],
        unidad        : json["unidad"],
        descripcion   : json["descripcion"],
        uid           : json["uid"],
        //createdAt     : json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        //updatedAt     : json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "estadoregistro": estadoregistro,
        "nombre"        : nombre,
        "presentacion"  : presentacion,
        "unidad"        : unidad,
        "descripcion"   : descripcion,
        "uid"           : uid,
        //"createdAt"     : createdAt == null ? null : createdAt.toIso8601String(),
        //"updatedAt"     : updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
