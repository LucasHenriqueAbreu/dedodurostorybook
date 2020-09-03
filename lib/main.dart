import 'package:dedodurostorybook/render.dart';
import 'package:flutter/material.dart';

// DedoDuroTela (
//    selecao-do-menu: RECLAMACOES
//    corpo: ReclamacoesTela (reclamacoes: [
//       ReclamacaoItem (
//          titulo: "Buraco na Rua"
//          descricao: "Tem um buraco dhuhf nfreunfuierferfnurhf"
//          foto: "file://test/assets/buraco1.jpg"
//          estrelinhas: 4
//       )
//       ReclamacaoItem (
//          titulo: "Buraco na Rua"
//          descricao: "Tem um buraco dhuhf nfreunfuierferfnurhf"
//          foto: "file://test/assets/buraco2.jpg"
//          estrelinhas: 5
//       )
//       total: 56536253625
//    ])

// DedoDuro (
//    selecao-do-menu: RECLAMACOES
//    corpo: Reclamacoes (reclamacoes: [
//       buracoNaRua()
//       posteQuebrado()
//    ])
// )

enum Abas { DASHBOARD, RECLAMACOES, PERFIL }

var story1 = {
  'selecaoDoMenu': Abas.RECLAMACOES,
  'reclamacoes': [
    {
      'titulo': 'Reclamacao 1',
      'descricao': 'Lorem ipsum dolor sit amet, conse',
      'foto': 'assets/img1.png',
    },
    {
      'titulo': 'Reclamacao 2',
      'descricao': 'Lorem ipsum dolor sit amet, conse asdf',
      'foto': 'assets/img2.png',
    },
  ],
};

var list = List<int>.generate(3000, (i) => i + 1);
var story2 = {
  'selecaoDoMenu': Abas.DASHBOARD,
  'reclamacoes': list
      .map(
        (e) => {
          'titulo': 'Reclamacao $e',
          'descricao': 'Lorem ipsum dolor sit amet, conse $e',
          'foto': 'assets/img2.png',
        },
      )
      .toList()
};

var story3 = {
  'selecaoDoMenu': Abas.RECLAMACOES,
  'reclamacao': {
    'id': '',
    'titulo': '',
    'descricao': '',
    'foto': '',
    'latitude': -25.8566167,
    'longitude': -52.5294107
  }
};

void main() {
  runApp(MyApp(
    story: story3,
  ));
}

class MyApp extends StatelessWidget {
  final dynamic story;
  const MyApp({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(
        story: story,
      ),
    );
  }
}

class Home extends StatefulWidget {
  final story;
  Home({Key key, this.story}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _story;

  @override
  void initState() {
    _story = widget.story;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Render().build(_story, _callback);
  }

  _callback() {
    setState(() {
      _story = _story == story1 ? story2 : story1;
    });
  }
}
