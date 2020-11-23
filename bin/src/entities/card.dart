class Card {
  int id;
  String title;
  String content;

  //Construtor normal que recebe id, title e content
  Card(this.id, this.title, this.content);

  //Construtor com nome fromJson que pega os valores do map e coloca nos atributos
  Card.fromJson(dynamic map) {
    id = map['id'];
    title = map['title'];
    content = map['titletitle'];
  }
  //Método toJson() que retorna um map com as informações do Card
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'content': content};
  }
  @override
  String toString() {
    return 'Id $id ... title $title ... conteudo $content';
  }
}
