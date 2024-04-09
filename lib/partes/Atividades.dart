import '../models/atuacao.dart';
import 'package:flutter/material.dart';

import 'fetch_api.dart';

class Atuacoes extends StatefulWidget {
  const Atuacoes({Key? key, this.id}) : super(key: key);

  final int? id;

  @override
  State<Atuacoes> createState() => _AtuacoesState();
}

class _AtuacoesState extends State<Atuacoes> {
  late Future<List<Atuacao>> _futureAtuacao;

  @override
  void initState() {
    super.initState();
    _futureAtuacao = fetchAtuacoes(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Atuacao>>(
      future: _futureAtuacao,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Ocorreu um erro: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return MostraAtuacoes(atuacoes: snapshot.data!);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MostraAtuacoes extends StatelessWidget {
  const MostraAtuacoes({Key? key, required this.atuacoes}) : super(key: key);

  final List<Atuacao> atuacoes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.74,
      height: MediaQuery.of(context).size.width * 0.55,
      child: ListView.builder(
        itemCount: atuacoes.length,
        itemBuilder: (context, index) {
          final atividade = atuacoes[index];
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.5)),
              ),
            ),
            child: Column(
              children: [
                _buildRow(
                    'Descrição:',
                    atividade.descricao ??
                        ''), // Tratar valor possivelmente nulo
                _buildRow(
                    'Início:',
                    atividade.dataHoraInicio ??
                        ''), // Tratar valor possivelmente nulo
                _buildRow(
                    'Fim:',
                    atividade.dataHoraFim ??
                        ''), // Tratar valor possivelmente nulo
                _buildRow(
                    'Situação:',
                    atividade.situacao ??
                        ''), // Tratar valor possivelmente nulo
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
