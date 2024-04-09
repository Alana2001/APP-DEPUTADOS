import '../models/atuacao.dart';
import '../models/comissao.dart';
import '../models/integrantes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/deputado.dart';
import '../models/custos.dart';

Future<List<Deputado>> buscarDeputados(String tipo) async {
  List<Deputado>? deputados = await fetchDeputados();

  List<Deputado>? DeputadosFiltrados = deputados
      .where((deputados) =>
          deputados.nome!.toLowerCase().contains(tipo.toLowerCase()) ||
          deputados.siglaPartido!.toLowerCase().contains(tipo.toLowerCase()) ||
          deputados.siglaUf!.toLowerCase().contains(tipo.toLowerCase()) ||
          deputados.email!.toLowerCase().contains(tipo.toLowerCase()))
      .toList();

  return DeputadosFiltrados;
}

Future<List<Atuacao>> fetchAtuacoes(int? id) async {
  final response = await http.get(Uri.parse(
      'https://dadosabertos.camara.leg.br/api/v2/deputados/${id}/eventos?ordem=ASC&ordenarPor=dataHoraInicio'));

  if (response.statusCode == 200) {
    final jsonDecoded = jsonDecode(response.body);
    final AtuacaoJson = jsonDecoded['dados'] as List<dynamic>;

    return AtuacaoJson.map((json) => Atuacao.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch deputados');
  }
}

Future<List<Conta>> fetchDespesas(int? id) async {
  final response = await http.get(Uri.parse(
      'https://dadosabertos.camara.leg.br/api/v2/deputados/${id}/despesas?ordem=ASC&ordenarPor=mes'));

  if (response.statusCode == 200) {
    final jsonDecoded = jsonDecode(response.body);
    final despesaJson = jsonDecoded['dados'] as List<dynamic>;

    return despesaJson.map((json) => Conta.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch deputados');
  }
}

Future<List<Deputado>> fetchDeputados() async {
  final response = await http
      .get(Uri.parse('https://dadosabertos.camara.leg.br/api/v2/deputados'));

  if (response.statusCode == 200) {
    final jsonDecoded = jsonDecode(response.body);
    final deputadosJson = jsonDecoded['dados'] as List<dynamic>;

    return deputadosJson.map((json) => Deputado.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch deputados');
  }
}

Future<List<Comissao>> fetchComissao() async {
  final response = await http.get(Uri.parse(
      'https://dadosabertos.camara.leg.br/api/v2/orgaos?ordem=ASC&ordenarPor=id'));

  if (response.statusCode == 200) {
    final jsonDecoded = jsonDecode(response.body);
    final ComissaoJson = jsonDecoded['dados'] as List<dynamic>;

    return ComissaoJson.map((json) => Comissao.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch deputados');
  }
}

Future<List<Integrante>> fetchIntegrantes(int? id) async {
  final response = await http.get(Uri.parse(
      'https://dadosabertos.camara.leg.br/api/v2/orgaos/${id}/membros'));

  if (response.statusCode == 200) {
    final jsonDecoded = jsonDecode(response.body);
    final despesaJson = jsonDecoded['dados'] as List<dynamic>;

    return despesaJson.map((json) => Integrante.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch deputados');
  }
}
