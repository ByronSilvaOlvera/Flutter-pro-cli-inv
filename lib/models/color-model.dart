

// To parse this JSON data, do
//
//     final color = colorFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

List<ColorDetalle> colorDetalleFromJson(String str) => List<ColorDetalle>.from(json.decode(str).map((x) => ColorDetalle.fromJson(x)));

String colorDetalleToJson(List<ColorDetalle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ColorDetalle {
    ColorDetalle({
        this.fondocolor,
        this.appbarcolor,
        this.iconcolor,
        this.fechacolor,
        this.fechacoloricon,
        this.fechacoloriconbtn,
        this.saveiconcolor,
        this.titulos,
    });

    Color fondocolor;
    Color appbarcolor;
    Color iconcolor;
    Color fechacolor;
    Color fechacoloricon;
    Color fechacoloriconbtn;
    Color saveiconcolor;
    Titulos titulos;

   factory ColorDetalle.fromJson(Map<String, dynamic> json) => ColorDetalle(
        fondocolor    : json["fondocolor"],
        appbarcolor   : json["appbarcolor"],
        iconcolor     : json["iconcolor"],
        fechacolor    : json["fechacolor"],
        fechacoloricon: json["fechacoloricon"],
        saveiconcolor : json["saveiconcolor"],
        titulos       : Titulos.fromJson(json["titulos"]),
    );

    Map<String, dynamic> toJson() => {
        "fondocolor"    : fondocolor,
        "appbarcolor"   : appbarcolor,
        "iconcolor"     : iconcolor,
        "fechacolor"    : fechacolor,
        "fechacoloricon": fechacoloricon,
        "saveiconcolor" : saveiconcolor,
        "titulos"       : titulos.toJson(),
    };
}

class Titulos {
    Titulos({
        this.tituloone,
        this.titulotwo,
        this.titulobar,
    });

    String tituloone;
    String titulotwo;
    String titulobar;

    factory Titulos.fromJson(Map<String, dynamic> json) => Titulos(
        tituloone: json["tituloone"],
        titulotwo: json["titulotwo"],
        titulobar: json["titulobar"],
    );

    Map<String, dynamic> toJson() => {
        "tituloone": tituloone,
        "titulotwo": titulotwo,
        "titulobar": titulobar,
    };
}
