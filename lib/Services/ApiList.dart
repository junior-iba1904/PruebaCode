import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/Model/Incidencia.dart';
import 'package:http/http.dart' as http;

class IncidenciaService {
  Stream<Incidencia> fetchIncidencias(String usuarioId) async* {
    final response = await http.post(
      Uri.parse("http://216.244.171.252/SISTE/api/incidencia/?op=listar"),
      body: {
        "usua_id_siso": usuarioId,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      int count = 0;
      for (var item in data) {
        if (count >= 10) break;
        yield Incidencia.fromJson(item);
        count++;
        print(count);
      }
    } else {
      throw Exception('Failed to load incidencias');
    }
  }
}
