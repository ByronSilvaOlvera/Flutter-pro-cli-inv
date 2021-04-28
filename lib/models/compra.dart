// To parse this JSON data, do
//
//     final compra = compraFromJson(jsonString);

import 'dart:convert';

List<Compra> compraFromJson(String str) => List<Compra>.from(json.decode(str).map((x) => Compra.fromJson(x)));

String compraToJson(List<Compra> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Compra {
    Compra({
        this.fecha,
        this.documento,
        this.proveedorid,
        this.detalles,
        this.sumadetalles,
        this.subtotalcero,
        this.subtotalimpuesto,
        this.impuestos,
        this.totaldocumento,
        this.uid,
    });

    DateTime fecha;
    String documento;
    String proveedorid;
    List<Detalle> detalles;
    int sumadetalles;
    int subtotalcero;
    int subtotalimpuesto;
    int impuestos;
    int totaldocumento;
    String uid;

    factory Compra.fromJson(Map<String, dynamic> json) => Compra(
        fecha           : DateTime.parse(json["fecha"]),
        documento       : json["documento"],
        proveedorid     : json["proveedorid"],
        detalles        : List<Detalle>.from(json["detalles"].map((x) => Detalle.fromJson(x))),
        sumadetalles    : json["sumadetalles"],
        subtotalcero    : json["subtotalcero"],
        subtotalimpuesto: json["subtotalimpuesto"],
        impuestos       : json["impuestos"],
        totaldocumento  : json["totaldocumento"],
        uid             : json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "fecha"           : fecha.toIso8601String(),
        "documento"       : documento,
        "proveedorid"     : proveedorid,
        "detalles"        : List<dynamic>.from(detalles.map((x) => x.toJson())),
        "sumadetalles"    : sumadetalles,
        "subtotalcero"    : subtotalcero,
        "subtotalimpuesto": subtotalimpuesto,
        "impuestos"       : impuestos,
        "totaldocumento"  : totaldocumento,
        "uid"             : uid,
    };
}

class Detalle {
    Detalle({
        this.id,
        this.productoid,
        this.cantidad,
        this.costo,
        this.totaldetalle,
    });

    String id;
    String productoid;
    int cantidad;
    double costo;
    int totaldetalle;

    factory Detalle.fromJson(Map<String, dynamic> json) => Detalle(
        id          : json["_id"],
        productoid  : json["productoid"],
        cantidad    : json["cantidad"],
        costo       : json["costo"].toDouble(),
        totaldetalle: json["totaldetalle"],
    );

    Map<String, dynamic> toJson() => {
        "_id"         : id,
        "productoid"  : productoid,
        "cantidad"    : cantidad,
        "costo"       : costo,
        "totaldetalle": totaldetalle,
    };
}
