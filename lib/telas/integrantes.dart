import '../partes/Rodape.dart';
import 'package:flutter/material.dart';
import '../models/deputado.dart';
import '../models/integrantes.dart';
import '../partes/fetch_api.dart';
import 'detalhes.dart';

class Integrantes extends StatefulWidget {
  const Integrantes({Key? key, required this.title}) : super(key: key);

  static const routeName = 'integrantes';

  final String title;

  @override
  _IntegrantesState createState() => _IntegrantesState();
}

class _IntegrantesState extends State<Integrantes> {
  late Future<List<Integrante>> _futureIntegrantes;
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
    final int id = args['id'];
    _futureIntegrantes = fetchIntegrantes(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
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
      body: FutureBuilder<List<Integrante>>(
        future: _futureIntegrantes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('An error has occurred!');
          } else if (snapshot.hasData) {
            return IntegrantesList(integrantes: snapshot.data!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: RodaPe(indiceAtual: 2),
    );
  }
}

class IntegrantesList extends StatelessWidget {
  const IntegrantesList({Key? key, required this.integrantes})
      : super(key: key);

  final List<Integrante> integrantes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Integrantes',
              style: TextStyle(fontSize: 30, color: Colors.teal),
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
            itemCount: integrantes.length,
            itemBuilder: (context, index) {
              final integrante = integrantes[index];
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
                      'id': integrantes[index].id,
                      'nome': integrantes[index].nome,
                      'siglaPartido': integrantes[index].siglaPartido,
                      'siglaUf': integrantes[index].uf,
                      'urlFoto': integrantes[index].urlFoto,
                      'email': integrantes[index].email,
                    },
                  ),
                  borderRadius: BorderRadius.circular(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "${integrante.urlFoto}",
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${integrante.nome}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${integrante.siglaPartido}",
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
