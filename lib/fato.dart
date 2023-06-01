class Fato {
  String titulo;
  String texto;
  String linkImagem;

  Fato({
    required this.titulo,
    required this.texto,
    required this.linkImagem,
  });
  //nome do construtor sempre vai ser o mesmo da classe
}

class BancoFato {
  static List<Fato> fatos = [
    Fato(
      titulo: "Lhasa apso",
      texto:
          " É uma raça de cães de pequeno porte. As características físicas da raça são resultado do clima de onde a raça fora criada. O pelo é longo e denso, muitas vezes com mais de uma cor. São muito amorosos e companheiros. ",
      linkImagem:
          "https://i0.wp.com/www.portaldodog.com.br/cachorros/wp-content/uploads/2019/11/shih-tzu-dog_138545-9.jpg?resize=612%2C487&ssl=1",
    ),
    Fato(
      titulo: "Pastor Alemão",
      texto:
          "Também chamado de capa preta, ostenta em seu rosto a sua personalidade confiante e corajosa, enquanto suas atitudes costumam expressar toda a sua força, inteligência e instinto protetor.",
      linkImagem:
          "https://www.gpabrasil.com.br/wp-content/uploads/2018/03/pastoralemao.jpg",
    ),
    Fato(
      titulo: "Husky siberiano",
      texto:
          "Sua cara de lobo e seu porte podem ser intimidadores. Mas, na verdade, o husky siberiano é amigável, gentil e sociáve.",
          
      linkImagem:
          "https://love.doghero.com.br/wp-content/uploads/2018/08/husky-siberiano-2.webp",
    )
  ];

  static void adicionar(Fato fato){
    fatos .add(fato);

  }
}
