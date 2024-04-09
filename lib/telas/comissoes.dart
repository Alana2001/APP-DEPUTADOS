import 'integrantes.dart';
import '../models/comissao.dart';
import 'package:flutter/material.dart';
import '../partes/fetch_api.dart';
import 'pesquisas.dart';
import '../partes/Rodape.dart';

class Comissoes extends StatefulWidget {
  const Comissoes({Key? key}) : super(key: key);
  static const routeName = 'comissoes';

  @override
  _ComissoesState createState() => _ComissoesState();
}

class _ComissoesState extends State<Comissoes> {
  late Future<List<Comissao>> _futureComissoes;
  bool showPesquisa = false;

  @override
  void initState() {
    super.initState();
    _futureComissoes = fetchComissao();
  }

  bool pesquisaVisible = false;
  TextEditingController pesquisaController = TextEditingController();

  void handlePesquisa(String pesquisaTerm) {
    // realizar a pesquisa
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
        backgroundColor: Colors.blue[700],
        title: showPesquisa
            ? TextField(
                onSubmitted: handlePesquisa,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Faça uma pesquisa',
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(179, 7, 7, 7)),
                ),
              )
            : Text('Comissões'),
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
      body: FutureBuilder<List<Comissao>>(
        future: _futureComissoes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('An error has occurred!');
          } else if (snapshot.hasData) {
            return DeputadosList(comissoes: snapshot.data!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: RodaPe(indiceAtual: 2),
    );
  }
}

class DeputadosList extends StatelessWidget {
  const DeputadosList({Key? key, required this.comissoes}) : super(key: key);

  final List<Comissao> comissoes;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(
            'Comissões',
            style: TextStyle(fontSize: 30, color: Colors.blue[700]),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: comissoes.length,
            itemBuilder: (context, index) {
              final comissao = comissoes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(
                      context,
                      Integrantes.routeName,
                      arguments: {
                        'id': comissoes[index].id,
                      },
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${comissao.nome}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
