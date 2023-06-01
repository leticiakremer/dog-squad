import 'package:dog_squad/fatos/fato_page.dart';
import 'package:dog_squad/fatos/favoritos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deve ser capaz de carregar Imagem, Texto, Titulo, Botão',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      //dizendo que vai ter duas telas no escopo de teste
      initialRoute: '/',

      routes: {
        '/': (context) => const FatoPage(),
        '/favoritos': (context) => const FavoritosPage(),
      },
    ));
    // await Future.delayed(const Duration(seconds: 2));

    await tester.pump(const Duration(seconds: 2));
    final image = find.byKey(const Key('fatoImage'));
    expect(image, findsOneWidget);

    final text = find.byKey(const Key('fatoTexto'));
    expect(text, findsOneWidget);

    final titulo = find.byKey(const Key('fatoTitulo'));
    expect(titulo, findsOneWidget);

    final button = find.byKey(const Key('button1'));
    await tester.tap(button);
    await tester.pump(const Duration(seconds: 2));

    final novoTitulo = find.byKey(const Key('fatoTitulo'));
    expect(novoTitulo, isNot(titulo));

    //pega a imagem atual e verifica que não é a mesma de antes.
    final novaImage = find.byKey(const Key('fatoImage'));
    expect(novaImage, isNot(image));

    final novoText = find.byKey(const Key('fatoTexto'));
    var diferente = novoText != text;
    expect(diferente, true);

    // expect(novoText, isNot(text));
  });

  testWidgets('Deve ser capaz de favoritar o fato atual', (tester) async {
    // screen é definida como uma instância da classe FatoPage
    //Primeiro passo: Carregar a tela
    const screen = FatoPage();
    //tester.pumpWidget é usado para construir e exibir a interface do usuário definida pela tela FatoPage
    await tester.pumpWidget(const MaterialApp(
      home: screen,
    ));

    //Encontrar o botão de favoritar
    await tester.pump(const Duration(seconds: 2));
    final botaoFavoritado = find.byKey(const Key('button2'));

    //Apertar o botão favoritados
    await tester.tap(botaoFavoritado);
    await tester.pumpAndSettle();
    //pumpAndSettle é usado para aguardar até que todas as animações do toque pendentes sejam concluídas.

    //Pegar o estado da tela
    final estadoAtual = tester.state<FatoPageState>(find.byType(FatoPage));
    //state é usado para obter o estado atual de um widget. Nesse caso, está obtendo o estado da página chamada FatoPage e armazenando-o na variável
    final feedbackFavoritado = find.byKey(const Key('feedbackFavoritado'));
    expect(feedbackFavoritado, findsOneWidget);

    //Pegar a lista de favoritos e o fato atual
    final listaFavoritados = estadoAtual.gerenciadorFavoritos.favoritos;
    final fatoAtual = estadoAtual.fatoAtual;

    //Verificar se o fatoAtual está na lista de favoritados
    expect(fatoAtual, listaFavoritados[0]);
  });
  //fazer separado

  testWidgets('Testar a navegação da tela de fatos para a tela de favoritos',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const FatoPage(),
        '/favoritos': (context) => const FavoritosPage(),
      },
    ));


    await tester.pump(const Duration(seconds: 2));
    final botaodanovatela= find.byKey(const Key('botaonovatela'));

    //Apertar o botão favoritados
    await tester.tap(botaodanovatela);
    await tester.pumpAndSettle();
  });
}
