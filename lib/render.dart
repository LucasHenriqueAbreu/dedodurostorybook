import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fila_de_eventos.dart';

class Render {
  final _formKey = GlobalKey<FormState>();

  Widget build(dynamic story, void Function() callback) {
    return GestureDetector(
      onTap: callback,
      child: Scaffold(
        body: _createBody(story),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Dashboard',
              icon: Icon(Icons.dashboard),
            ),
            BottomNavigationBarItem(
              label: 'Reclamações',
              icon: Icon(Icons.people_alt),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.face),
            ),
          ],
          currentIndex: story['selecaoDoMenu']?.index,
          onTap: (int intex) => callback(),
        ),
      ),
    );
  }

  Widget _createBody(dynamic story) {
    return story['reclamacoes'] != null
        ? _createReclamacoes(story['reclamacoes'])
        : _createReclamacao(story['reclamacao']);
  }

  Widget _createReclamacoes(List<Map<String, dynamic>> reclamacoes) {
    return ListView.builder(
      itemCount: reclamacoes.length,
      itemBuilder: (context, index) {
        final reclamacao = reclamacoes[index];
        return ListTile(
          leading: Image.asset(reclamacao['foto']),
          title: Text(reclamacao['titulo']),
          subtitle: Text(reclamacao['descricao']),
        );
      },
    );
  }

  Widget _createReclamacao(Map<String, dynamic> reclamacao) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: _createInputs(reclamacao),
        ),
      ),
    );
  }

  List<Widget> _createInputs(Map<String, dynamic> reclamacao) {
    var titulo = _createInput('titulo', reclamacao['titulo']);
    var descricao = _createInput('descricao', reclamacao['descricao']);
    var foto = _createInput('foto', reclamacao['foto']);
    var latitude = _createInput('latitude', reclamacao['latitude']);
    var longitude = _createInput('longitude', reclamacao['longitude']);

    // var components = reclamacao.entries
    //     .where((element) => element.key != 'id')
    //     .map((item) => _createInput(item.key, item.value, reclamacao))
    //     .toList();
    List<Widget> components = [
      titulo,
      descricao,
      foto,
      latitude,
      longitude,
    ];
    components.add(RaisedButton(
      onPressed: () {
        FilaDeEventos.processa({
          'tipo': 'cadastroDeReclamacao',
          'titulo': titulo.controller.text,
          'descricao': descricao.controller.text,
          'foto': foto.controller.text,
          'latitude': latitude.controller.text,
          'longitude': longitude.controller.text,
        });
      },
      child: Text('Salvar'),
    ));
    return components;
  }

  TextFormField _createInput(String label, dynamic value) {
    return TextFormField(
      controller: TextEditingController(text: value.toString()),
      // onChanged: (newValue) => reclamacao[key] = newValue,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
