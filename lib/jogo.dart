import 'dart:math'; // Importa a biblioteca para gerar números aleatórios
import 'package:flutter/material.dart'; // Importa os widgets do Flutter

// Define a classe principal do jogo, que é um StatefulWidget
class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState(); // Cria o estado do jogo
}

// Classe que contém o estado do jogo
class _JogoState extends State<Jogo> {
  // Variável para armazenar a imagem do resultado
  var _imageResult = 'images/padrao.png';

  // Lista de imagens disponíveis para as jogadas
  var _images = ['images/pedra.png', 'images/papel.png', 'images/tesoura.png'];

  // Texto que exibirá o resultado do jogo
  Text _resultado = Text(
    'Resultado', // Texto inicial
    textAlign: TextAlign.center, // Alinhamento do texto
    style: TextStyle(
      color: Colors.white30, // Cor do texto
      fontSize: 25, // Tamanho da fonte
      fontWeight: FontWeight.bold, // Estilo da fonte
    ),
  );

  // Função para sortear a jogada do oponente
  int _sortear() {
    var n = Random().nextInt(_images.length); // Gera um número aleatório com base no tamanho da lista
    print(n); // Imprime o número sorteado no console

    setState(() { // Atualiza o estado do widget
      _imageResult = _images[n]; // Define a imagem do oponente
    });

    return n; // Retorna o número sorteado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Cria a estrutura básica da aplicação
      appBar: AppBar(
        title: Text('Jo Ken Po'), // Título da barra superior
        backgroundColor: Colors.indigo, // Cor de fundo da AppBar
      ),
      body: Column( // Organiza os widgets em uma coluna
        crossAxisAlignment: CrossAxisAlignment.center, // Alinhamento dos filhos
        children: <Widget>[ // Lista de widgets filhos
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16), // Espaçamento superior e inferior
            child: Text(
              'Oponente:', // Texto que indica o oponente
              textAlign: TextAlign.center, // Alinhamento do texto
              style: TextStyle(
                fontSize: 20, // Tamanho da fonte
                fontWeight: FontWeight.bold, // Estilo da fonte
                color: Colors.black54, // Cor do texto
              ),
            ),
          ),
          Image.asset(_imageResult), // Exibe a imagem do oponente
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10), // Espaçamento superior e inferior
            child: Text(
              'Sua escolha:', // Texto que indica a escolha do jogador
              textAlign: TextAlign.center, // Alinhamento do texto
              style: TextStyle(
                fontSize: 20, // Tamanho da fonte
                fontWeight: FontWeight.bold, // Estilo da fonte
                color: Colors.black54, // Cor do texto
              ),
            ),
          ),
          Row( // Organiza os botões de jogada em uma linha
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaçamento igual entre os filhos
            children: <Widget>[
              // Botão para a jogada "pedra"
              GestureDetector(
                onTap: () { // Define a ação ao tocar no botão
                  var n = _sortear(); // Sortear a jogada do oponente
                  _verificarResultado(0, n); // Verifica o resultado da jogada
                },
                child: Image.asset('images/pedra.png', height: 100), // Imagem da jogada "pedra"
              ),
              // Botão para a jogada "papel"
              GestureDetector(
                onTap: () {
                  var n = _sortear(); // Sortear a jogada do oponente
                  _verificarResultado(1, n); // Verifica o resultado da jogada
                },
                child: Image.asset(
                  'images/papel.png', // Imagem da jogada "papel"
                  height: 100,
                ),
              ),
              // Botão para a jogada "tesoura"
              GestureDetector(
                onTap: () {
                  var n = _sortear(); // Sortear a jogada do oponente
                  _verificarResultado(2, n); // Verifica o resultado da jogada
                },
                child: Image.asset(
                  'images/tesoura.png', // Imagem da jogada "tesoura"
                  height: 100,
                ),
              ),
            ],
          ),
          Column( // Exibe o resultado em uma coluna
            children: <Widget>[
              Container( // Container que envolve o resultado
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0), // Margens do container
                width: 250, // Largura do container
                height: 100, // Altura do container
                alignment: Alignment.center, // Alinhamento do conteúdo
                decoration: BoxDecoration( // Estilo do container
                  gradient: LinearGradient( // Gradiente de cor
                    begin: Alignment.topLeft, // Início do gradiente
                    end: Alignment.bottomRight, // Fim do gradiente
                    stops: [0.3, 0.1], // Posições do gradiente
                    colors: [
                      Colors.indigo, // Cor inicial do gradiente
                      Colors.indigoAccent, // Cor final do gradiente
                    ],
                  ),
                  border: Border.all( // Borda do container
                    width: 3, // Largura da borda
                    color: const Color(0xFFFFFFF), // Cor da borda
                  ),
                  borderRadius: BorderRadius.all( // Raio da borda
                    Radius.circular(56),
                  ),
                ),
                child: _resultado, // Exibe o resultado
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Função que verifica o resultado do jogo
  void _verificarResultado(int x, int y) {
    if ((x == 0 && y == 2) || // Pedra ganha de Tesoura
        (x == 1 && y == 0) || // Papel ganha de Pedra
        (x == 2 && y == 1)) { // Tesoura ganha de Papel
      _resultado = Text(
        'Você venceu!', // Texto quando o jogador vence
        textAlign: TextAlign.center, // Alinhamento do texto
        style: TextStyle(
          color: Colors.green, // Cor do texto
          fontSize: 30, // Tamanho da fonte
        ),
      );
    } else {
      _resultado = Text(
        'Você Perdeu!', // Texto quando o jogador perde
        textAlign: TextAlign.center, // Alinhamento do texto
        style: TextStyle(
          color: Colors.red, // Cor do texto
          fontSize: 30, // Tamanho da fonte
        ),
      );
    }
  }
}
