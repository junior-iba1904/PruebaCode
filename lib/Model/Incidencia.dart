class Incidencia {
  final int tickId;
  final int persId;
  final int catId;
  final int catsId;
  final String tickTitulo;
  final String tickDescrip;
  final String tickEstado;
  final DateTime fechCrea;
  final String prioridad;

  Incidencia({
    required this.tickId,
    required this.persId,
    required this.catId,
    required this.catsId,
    required this.tickTitulo,
    required this.tickDescrip,
    required this.tickEstado,
    required this.fechCrea,
    required this.prioridad,
  });

  factory Incidencia.fromJson(Map<String, dynamic> json) {
    return Incidencia(
      tickId: json['tick_id'],
      persId: json['pers_id'],
      catId: json['cat_id'],
      catsId: json['cats_id'],
      tickTitulo: json['tick_titulo'],
      tickDescrip: json['tick_descrip'],
      tickEstado: json['tick_estado'],
      fechCrea: DateTime.parse(json['fech_crea']),
      prioridad: json['prioridad'],
    );
  }
}
