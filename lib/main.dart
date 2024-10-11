import 'dart:math'; // Importa a biblioteca para gerar números aleatórios
import 'package:flutter/material.dart'; // Importa os widgets do Flutter

import 'jogo.dart'; // Importa a classe Jogo do arquivo jogo.dart

// Função principal que inicia a aplicação
void main(List<String> args) {
  runApp(MaterialApp(
    // Inicia o aplicativo Flutter
    debugShowCheckedModeBanner:
        false, // Remove a faixa de debug no canto superior direito
    home: Jogo(), // Define a tela inicial como o widget Jogo
  ));
}

// Define a classe Home, que é um StatefulWidget
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState(); // Cria o estado da classe Home
}

// Classe que contém o estado da Home
class _HomeState extends State<Home> {
  // Variável para armazenar a imagem do resultado
  var _imageResult = 'images/padrao.png';

  // Lista de imagens disponíveis para as jogadas
  var _images = ['images/pedra.png', 'images/papel.png', 'images/tesoura.png'];

  // Função para sortear uma jogada
  void _sortear() {
    var n = Random().nextInt(_images
        .length); // Gera um número aleatório com base no tamanho da lista
    print(n); // Imprime o número sorteado no console

    setState(() {
      // Atualiza o estado do widget
      _imageResult = _images[n]; // Define a imagem do resultado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cria a estrutura básica da aplicação
      appBar: AppBar(
        title: Text("JokenPo!"), // Título da barra superior
        backgroundColor: Colors.blue, // Cor de fundo da AppBar
      ),
      body: Container(
        // Container que envolve todo o conteúdo
        width: double.infinity, // Define a largura do container como total
        padding: EdgeInsets.all(20), // Adiciona preenchimento ao container
        child: Column(
          // Organiza os widgets em uma coluna
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Alinhamento dos filhos
          crossAxisAlignment: CrossAxisAlignment.center, // Alinhamento central
          children: <Widget>[
            // Lista de widgets filhos
            Image.asset(_imageResult), // Exibe a imagem do resultado
            Text(
              'Clique para dar resultado', // Texto de instrução
              textAlign: TextAlign.justify, // Alinhamento do texto
              style: TextStyle(
                  fontSize: 17, // Tamanho da fonte
                  fontStyle: FontStyle.italic, // Estilo da fonte (itálico)
                  color: Colors.black54 // Cor do texto
                  ),
            ),
            ElevatedButton(
              // Botão elevado
              child: Text(
                'Jo Ken Po', // Texto do botão
                style: TextStyle(
                    fontSize: 20, // Tamanho da fonte
                    color: Colors.white, // Cor do texto
                    fontWeight: FontWeight.bold // Estilo da fonte (negrito)
                    ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Cor de fundo do botão
              ),
              onPressed:
                  _sortear, // Define a função a ser chamada ao pressionar o botão
            )
          ],
        ),
      ),
    );
  }
}
