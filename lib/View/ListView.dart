import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/Incidencia.dart';
//import 'package:flutter_application_1/ViewModel/IncidenciaViewModel.dart';
import 'package:flutter_application_1/ViewModel/ListViewModel.dart';
import 'package:provider/provider.dart';

class IncidenciaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<IncidenciaViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Incidencias'),
      ),
      body: Column(
        children: [
          if (viewModel.isLoading)
            Center(child: CircularProgressIndicator())
          else
            Expanded(
              child: StreamBuilder<Incidencia>(
                stream: viewModel.incidenciasStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('No hay datos disponibles'));
                  } else {
                    return ListView.builder(
                      itemCount: viewModel.incidencias.length,
                      itemBuilder: (context, index) {
                        final incidencia = viewModel.incidencias[index];
                        return ListTile(
                          title: Text(incidencia.tickTitulo),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Fecha de creación: ${incidencia.fechCrea}'),
                              Text('Prioridad: ${incidencia.prioridad}'),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.fetchIncidencias('5920');
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
