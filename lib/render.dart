import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Render {
  Widget build(dynamic story, void Function() callback) {
    return GestureDetector(
      onTap: callback,
      child: Scaffold(
        body: _createReclamacoes(story['reclamacoes']),
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
        ),
      ),
    );
  }

  _createReclamacoes(List<Map<String, dynamic>> reclamacoes) {
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
}
