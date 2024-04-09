import 'package:flutter/material.dart';
// ignore: unused_import
import '../partes/Atividades.dart';
import '../partes/custos.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({Key? key});
  static const routeName = 'detalhes';

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final String? nome = args['nome'];
    final int? id = args['id'];
    final String? siglaPartido = args['siglaPartido'];
    final String? siglaUf = args['siglaUf'];
    final String? urlFoto = args['urlFoto'];
    final String? email = args['email'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Detalhes do Deputado'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/fundo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 3),
                    image: DecorationImage(
                      image: NetworkImage(urlFoto ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  nome ?? '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Partido: ${siglaPartido ?? ''}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'UF: ${siglaUf ?? ''}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'E-mail: ${email ?? ''}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Gastos: ${nome ?? ''}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Custos(id: id),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Atividades Recentes'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Atividades(id: id),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Fechar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.history),
                  label: Text('Feitos Recentes'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    textStyle: TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Atividades extends StatelessWidget {
  final int? id;

  const Atividades({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implemente aqui o código para exibir as atividades do deputado com o ID fornecido
    return Container();
  }
}
