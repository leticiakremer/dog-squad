import 'dart:math';
import 'package:dog_squad/favoritos.dart';
import 'package:flutter/material.dart';
import '../fato.dart';

class FatoPage extends StatefulWidget {
  const FatoPage({
    Key? key,
  }) : super(key: key);

  @override
  FatoPageState createState() => FatoPageState();
}

class FatoPageState extends State<FatoPage> {
  Fato fatoAtual = BancoFato.fatos[0];

  List<Fato> fatos = BancoFato.fatos;
  FatosFavoritados gerenciadorFavoritos = FatosFavoritados();

  void alterarFato() {
    Random random = Random();
    var posicao = random.nextInt(fatos.length);
    var novoFato = BancoFato.fatos[posicao];
    if (novoFato.titulo != fatoAtual.titulo) {
      setState(() {
        fatoAtual = novoFato;
      });
    } else {
      alterarFato();
    }
  }

  @override
  void initState() {
    alterarFato();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fatoAtual.titulo),
        actions: [
          //colocar a key no botão
          IconButton(
            key: const Key("botaonovatela"),
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.pushNamed(context, '/favoritos');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 206, 194, 194),
              Color.fromARGB(255, 56, 56, 54),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                fatoAtual.titulo,
                key: const Key('fatoTitulo'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white, // Cor do texto
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.network(
                fatoAtual.linkImagem,
                key: const Key('fatoImage'), //key teste
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    fatoAtual.texto,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    key: const Key('fatoTexto'),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn',
            onPressed: () {
              // ação do botão 1 quando for pressionado
              alterarFato();
            },
            key: const Key("button1"), //key teste
            child: const Icon(Icons.replay),
          ),
          const SizedBox(width: 16), // espaço entre os botões
          FloatingActionButton(
            onPressed: () {
              gerenciadorFavoritos.favoritarFato(fatoAtual);
              final snackBar = SnackBar(
                key: const Key("feedbackFavoritado"), //key teste
                content: const Text('Ação favoritada!'),
                backgroundColor: Colors.green,
                action: SnackBarAction(
                  label: 'Undo',
                  textColor: Colors.white,
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            key: const Key("button2"),
            child: const Icon(Icons.hotel_class),
          ),
        ],
      ),
    );
  }
}
