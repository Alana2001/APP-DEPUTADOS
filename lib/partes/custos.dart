import '../models/custos.dart';
import '../partes/fetch_api.dart';
import 'package:flutter/material.dart';

class Custos extends StatefulWidget {
  final int? id;
  const Custos({super.key, this.id});

  @override
  State<Custos> createState() => _CustosState();
}

class _CustosState extends State<Custos> {
  late Future<List<Conta>> _futureDespesa;
  @override
  void initState() {
    super.initState();
    _futureDespesa = fetchDespesas(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Conta>>(
      future: _futureDespesa,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('An error has occurred!');
        } else if (snapshot.hasData) {
          return MostraCusto(despesas: snapshot.data!);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MostraCusto extends StatelessWidget {
  const MostraCusto({super.key, required this.despesas});
  final List<Conta> despesas;

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
      height: MediaQuery.of(context).size.width * 0.35,
      child: ListView.builder(
        itemCount: despesas.length,
        itemBuilder: (context, index) {
          final gasto = despesas[index];
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.5)))),
            child: Column(
              children: [
                Text(
                  "Serviço: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text("${gasto.tipoConta}"),
                Text(
                  "Custo: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("R\$ ${gasto.valorConta},00"),
              ],
            ),
          );
        },
      ),
    );
  }
}
