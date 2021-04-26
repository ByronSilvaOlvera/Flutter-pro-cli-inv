
class EntidadResponse {
    EntidadResponse({
        this.ok,
        this.msg,
        this.entidad,
    });

    bool ok;
    String msg;
    dynamic entidad;

    factory EntidadResponse.fromJson(Map<String, dynamic> json) => EntidadResponse (
        ok: json["ok"],
        msg: json["msg"],
       //entidad: List<T>.from(json["entidad"])
        entidad: json["entidad"],
        //json.cast()
    );
  
}
