# Aplicativo de Consumo da API dos Deputados do Brasil

Este aplicativo foi desenvolvido utilizando o framework Flutter para consumir a API da Câmara dos Deputados do Brasil. Ele permite visualizar informações sobre os deputados, incluindo seus detalhes e gastos.

# Configuração:

Faça a instalação do flutter e suas dependencias.

Dependencias utilizadas no pubspec.yaml:

dependencies:
  device_preview:
  http:
  xml:
  flutter:
    sdk: flutter

dev_dependencies:
  remove_diacritic: ^0.9.0
  flutter_test:
    sdk: flutter

flutter_lints: ^3.0.0

Atualize as dependencias caso for preciso.

# Execução:

Depois de configurar o ambiente, você pode executar o aplicativo no emulador ou em um dispositivo físico.

execute: "flutter run"
Escolha a Devices de sua preferência.

# Funcionalidades:

Passo a Passo do aplicativo, seguindo uma ordem de usabilidade com facilidade ajudando o usuário a utilizar o aplicativo de forma rápida e consiente.

- Visualizar lista de deputados com suas fotos de perfil, nome e sigla do partido.
- Acessar detalhes individuais de cada deputado, incluindo informações como nome, partido, estado, e-mail e gastos.
- Realizar pesquisas por nome e/ou UF de deputados.
- Visualizar gastos individuais de cada deputado.
- vizualiar uma tela de comissões.

# PASSO A PASSO - UTILIZANDO O APLICATIVO:
1 - ABRA O APP;
2 - ESCOLHA UM DEPUTADO DE SUA PREFERÊNCIA, ONDA NA TELA INICIAL VAI ESTÁ LISTANDO TODOS OS DEPUTADOS, TENDO INFORMAÇÕES COMO: A FOTO DO PERFIL, NOME COMPLETO E A SIGLA DO PARTIDO QUE ELE/ELA FAZ PARTE;
3 - LOGO EM SEGUINDA, SERÁ DIRECIONADO PARA A TELA DE INFORMAÇÕES DOS DEPUTADOS, ONDE TAMBÉM MOSTRA A FOTO DO PERFIL NOVAMENTE, COM O NOME COMPLETO, O PARTTIDO, ESTADO, SEU E-MAIL E OS GASTOS E SERVIÇOS, E TEM A OPÇÃO DE CONSULTAR AS ATIVIDADES RECENTES QUE FORAM REALIZADAS POR ELES, QUE SERÁ UM BOTÃO CENTRALIZADO NA TELA DE INFORMAÇÕES;
4 - PODERAM FAZER PESQUISAS, QUE SE LOCALIZA NA PARTE SUPERIOR DO APLICATIVO, NA TELA INICIA, PODENDO REALIZAR PESQUISAS PELO NOME DO DEPUTADO E UF;
5 - E POR ÚLTIMO TERÁ TODAS AS INORMAÇÕES DAS COMISSÕES DOS DEPUTADOS, SÓ APERTAR NO CANTO INFERIOR DIREITO NA TELA INCIAL, QUE IRÁ NAVEGAR PARA A PRÓXIMA TELA DE COMISSÕES.
