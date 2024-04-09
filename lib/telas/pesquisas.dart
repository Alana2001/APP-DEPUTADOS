import '../partes/Rodape.dart';
import 'package:flutter/material.dart';
import '../models/deputado.dart';
import '../partes/fetch_api.dart';
import 'HomePage.dart';

class PesquisaPage extends StatefulWidget {
  const PesquisaPage({Key? key, required this.title}) : super(key: key);

  static const routeName = 'pesquisa';

  final String title;

  @override
  _PesquisaPageState createState() => _PesquisaPageState();
}

class _PesquisaPageState extends State<PesquisaPage> {
  late Future<List<Deputado>> _futureDeputados;
  bool showPesquisa = false;
  bool isLoading = false;
  List<Deputado> pesquisaResults = [];

  @override
  void initState() {
    super.initState();
  }

  void handlePesquisa(String pesquisaTerm) {
    setState(() {
      isLoading = true;
    });

    buscarDeputados(pesquisaTerm).then((results) {
      setState(() {
        isLoading = false;
        pesquisaResults = results;
      });
    });
  }

  void clearPesquisa() {
    setState(() {
      showPesquisa = false;
      pesquisaResults = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final String campo = args['campo'];
    _futureDeputados = buscarDeputados(campo);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // Alterando a cor do appbar
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : pesquisaResults.isNotEmpty
              ? DeputadosList(deputados: pesquisaResults)
              : FutureBuilder<List<Deputado>>(
                  future: _futureDeputados,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('An error has occurred!');
                    } else if (snapshot.hasData) {
                      return DeputadosList(deputados: snapshot.data!);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
      bottomNavigationBar: RodaPe(indiceAtual: 1),
    );
  }
}
