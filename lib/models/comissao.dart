class Comissao {
  int? id;
  String? nome;

  Comissao({required this.id, required this.nome});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['apelido'] = this.nome;
    return data;
  }

  Comissao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['apelido'];
  }
}
