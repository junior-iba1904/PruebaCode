import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/Incidencia.dart';
import 'package:flutter_application_1/Services/ApiList.dart';
//import 'package:flutter_application_1/Services/IncidenciaService.dart';

class IncidenciaViewModel extends ChangeNotifier {
  final IncidenciaService _service = IncidenciaService();
  final StreamController<Incidencia> _streamController = StreamController<Incidencia>();
  List<Incidencia> _incidencias = [];

  List<Incidencia> get incidencias => _incidencias;
  Stream<Incidencia> get incidenciasStream => _streamController.stream;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchIncidencias(String usuarioId) async {
    _isLoading = true;


    try {
      await for (final incidencia in _service.fetchIncidencias(usuarioId)) {
        if (_incidencias.length >= 10) break;
        _incidencias.add(incidencia);
        _streamController.add(incidencia);
        notifyListeners();
      }
    } catch (e) {
      // Manejar error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
