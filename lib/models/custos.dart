class Contas {
  List<Conta>? dados;

  Contas({this.dados});

  Contas.fromJson(Map<String, dynamic> json) {
    if (json['dados'] != null) {
      dados = <Conta>[];
      json['dados'].forEach((v2) {
        dados!.add(Conta.fromJson(v2));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dados != null) {
      data['dados'] = this.dados!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Conta {
  String? tipoConta;
  double? valorConta;

  Conta({required this.tipoConta, required this.valorConta});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipoConta'] = this.tipoConta;
    data['valorConta'] = this.valorConta;
    return data;
  }

  Conta.fromJson(Map<String, dynamic> json) {
    tipoConta = json['tipoConta'];
    valorConta = json['valorConta'];
  }
}
