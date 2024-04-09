import '../telas/comissoes.dart';
import '../telas/pesquisas.dart';
import 'package:flutter/material.dart';

class RodaPe extends StatefulWidget {
  final int indiceAtual;

  RodaPe({Key? key, required this.indiceAtual}) : super(key: key);

  @override
  State<RodaPe> createState() => _RodaPeState();
}

class _RodaPeState extends State<RodaPe> {
  late int _indiceAtual;

  @override
  void initState() {
    super.initState();
    _indiceAtual = widget.indiceAtual;
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = MediaQuery.of(context).size.width * 0.08;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        iconSize: iconSize,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: iconSize - 5,
              color: _indiceAtual == 0 ? Colors.white : Colors.grey,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: iconSize - 5,
              color: _indiceAtual == 1 ? Colors.white : Colors.grey,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              size: iconSize - 5,
              color: _indiceAtual == 2 ? Colors.white : Colors.grey,
            ),
            label: 'Comissões',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/',
          (Route<dynamic> route) => false,
        );
        break;
      case 1:
        Navigator.pushNamedAndRemoveUntil(
          context,
          PesquisaPage.routeName,
          arguments: {
            'campo': '',
          },
          (Route<dynamic> route) => false,
        );
        break;
      case 2:
        Navigator.pushNamedAndRemoveUntil(
          context,
          Comissoes.routeName,
          (Route<dynamic> route) => false,
        );
        break;
    }
  }
}
