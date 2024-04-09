import 'package:appdeputados/partes/rodape.dart';

import '../models/deputado.dart';
import '../partes/fetch_api.dart';
import 'package:flutter/material.dart';
import 'detalhes.dart';
import 'pesquisas.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  static const routeName = '/';
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Deputado>> _futureDeputados;
  bool showPesquisa = false;

  @override
  void initState() {
    super.initState();
    _futureDeputados = fetchDeputados();
  }

  bool pesquisaVisible = false;
  TextEditingController pesquisaController = TextEditingController();

  void handlePesquisa(String pesquisaTerm) {
    Navigator.pushNamed(
      context,
      PesquisaPage.routeName,
      arguments: {
        'campo': pesquisaTerm,
      },
    );
  }

  void clearPesquisa() {
    setState(() {
      showPesquisa = false;
      pesquisaController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: showPesquisa
            ? TextField(
                onSubmitted: handlePesquisa,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Faça uma pesquisa',
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              )
            : Text(widget.title),
        actions: [
          if (showPesquisa)
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: clearPesquisa,
            )
          else
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  showPesquisa = true;
                });
              },
            ),
        ],
      ),
      body: FutureBuilder<List<Deputado>>(
        future: _futureDeputados,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Ocorreu um erro!');
          } else if (snapshot.hasData) {
            return DeputadosList(deputados: snapshot.data!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: RodaPe(indiceAtual: 0),
    );
  }
}

class DeputadosList extends StatelessWidget {
  const DeputadosList({Key? key, required this.deputados}) : super(key: key);

  final List<Deputado> deputados;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Deputados',
              style: TextStyle(fontSize: 30, color: Colors.deepPurple),
              textAlign: TextAlign.center,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: deputados.length,
            itemBuilder: (context, index) {
              final deputado = deputados[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    Detalhes.routeName,
                    arguments: {
                      'id': deputados[index].id,
                      'nome': deputados[index].nome,
                      'siglaPartido': deputados[index].siglaPartido,
                      'siglaUf': deputados[index].siglaUf ?? '', // Aqui
                      'urlFoto': deputados[index].urlFoto ?? '', // e aqui
                      'email': deputados[index].email,
                    },
                  ),
                  borderRadius: BorderRadius.circular(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(deputado.urlFoto ?? ''), // e aqui
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${deputado.nome}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${deputado.siglaPartido}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
