import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    //key no scaffold
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Favoritos"),
      ),
      body: Center(
        child: Hero(
          tag: 'fato',
          child: ElevatedButton(
            child: const Text("Aperte aqui para voltar"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
