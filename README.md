# Aplicativo de Consumo da API dos Deputados do Brasil

Este aplicativo foi desenvolvido utilizando o framework Flutter para consumir a API da Câmara dos Deputados do Brasil. Ele permite visualizar informações sobre os deputados, incluindo seus detalhes e gastos.

# Configuração:

Faça a instalação do flutter e suas dependencias.

Dependencias utilizadas no pubspec.yaml:

dependencies:
  -device_preview:
  -http:
  -xml:
  -flutter:
    -sdk: flutter

dev_dependencies:
  -remove_diacritic: ^0.9.0
  -flutter_test:
    -sdk: flutter

-flutter_lints: ^3.0.0

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

# Instruções para Utilizar o Aplicativo de Consumo da API dos Deputados do Brasil

1. **Abrir o Aplicativo**
   - Ao abrir o aplicativo, será exibida uma lista de todos os deputados, mostrando informações como foto do perfil, nome completo e sigla do partido.

2. **Escolher um Deputado**
   - Navegue pela lista de deputados e escolha o deputado de sua preferência.
   - Clique no deputado desejado para visualizar mais informações.

3. **Visualizar Informações do Deputado**
   - Na tela de informações do deputado, você verá novamente a foto do perfil, nome completo, partido, estado, e-mail, gastos e serviços.
   - Haverá um botão centralizado para consultar as atividades recentes realizadas pelo deputado.

4. **Realizar Pesquisas**
   - No topo do aplicativo, na tela inicial, há um campo de pesquisa.
   - Você pode pesquisar deputados pelo nome ou UF (Unidade Federativa).

5. **Acessar Informações das Comissões**
   - Na tela inicial, clique no canto inferior direito para navegar para a tela de comissões.
   - Lá, você encontrará todas as informações sobre as comissões dos deputados.

