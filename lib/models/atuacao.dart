class Atuacoes {
  List<Atuacao>? dados;

  Atuacoes({this.dados});

  Atuacoes.fromJson(Map<String, dynamic> json) {
    if (json['dados'] != null) {
      dados = <Atuacao>[];
      json['dados'].forEach((v) {
        dados!.add(Atuacao.fromJson(v));
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

class Atuacao {
  String? dataHoraInicio;
  String? dataHoraFim;
  String? situacao;
  String? descricao;

  Atuacao(
      {required this.dataHoraInicio,
      required this.dataHoraFim,
      required this.situacao,
      required this.descricao});

  Atuacao.fromJson(Map<String, dynamic> json) {
    dataHoraInicio = json['dataHoraInicio'];
    dataHoraFim = json['dataHoraFim'];
    situacao = json['situacao'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataHoraInicio'] = this.dataHoraInicio;
    data['dataHoraFim'] = this.dataHoraFim;
    data['situacao'] = this.situacao;
    data['descricao'] = this.descricao;
    return data;
  }
}
