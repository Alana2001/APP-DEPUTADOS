import '../telas/comissoes.dart';
import '../telas/integrantes.dart';
import 'package:flutter/material.dart';

import '../telas/HomePage.dart';
import '../telas/detalhes.dart';
import '../telas/pesquisas.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Lista de Deputados';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Deputados',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          //color: Colors.lightBlue, // cor de fundo
          foregroundColor: Colors.white, // cor do texto
          elevation: 2, // sombreamento
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: appTitle),
        Detalhes.routeName: (context) => Detalhes(),
        'pesquisas': (context) => PesquisaPage(title: 'Pesquisa'),
        "comissoes": (context) => Comissoes(),
        "integrantes": (context) => Integrantes(
              title: 'Integrantes',
            ),
      },
    );
  }
}
