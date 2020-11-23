import 'dart:io';
import '../entities/card.dart';
import '../services/cardService.dart';

class CardController {
  CardController();

  //3.1.2 Criar método para recuperar todos os cards
  void carregaCards() async {
    var cardServ = CardService();
    if (await cardServ.carregarCards()) {
      print('\nCards Carregados com sucesso.');
    } else {
      print('Não foi possível carregar os cards.');
    }
  }

  //3.1.3 Criar método para recuperar card por ID
  void buscarCardId() async {
    var cardServ = CardService();
    print('Digite o ID do card que deseja procurar: ');
    var id = int.tryParse(stdin.readLineSync());
    if (await cardServ.buscarCardId(id)) {
      print('Busca realizada com sucesso.');
    } else {
      print('Não foi possível encontrar o card pesquisado.');
    }
  }

  //3.1.4 Criar método para salvar card
  void salvarCard() async {
    var cardServ = CardService();

    print('Digite o ID:');
    var id = int.tryParse(stdin.readLineSync());
    print('Digite o Título:');
    var title = stdin.readLineSync();
    print('Digite o Conteúdo:');
    var content = stdin.readLineSync();

    var card = Card(id, title, content);

    if (await cardServ.salvarCard(card)) {
      print('Card salvo com sucesso.');
    } else {
      print('Não foi possível salvar o card.');
    }
  }

  //3.1.5 Criar método para atualizar o card
  void atualizarCard() async {
    var cardServ = CardService();

    print('Digite o ID que deseja atualizar:');
    var id = int.tryParse(stdin.readLineSync());
    print('Digite um novo Título para o ID selecionado:');
    var title = stdin.readLineSync();
    print('Digite um novo Conteúdo para o ID selecionado:');
    var content = stdin.readLineSync();

    var card = Card(id, title, content);

    if (await cardServ.atualizarCard(card)) {
      print('\nCard salvo com sucesso.');
    } else {
      print('\nNão foi possível salvar o card.');
    }
  }

  //3.1.6 Criar método para remover card
  void deletarCard() async {
    var cardServ = CardService();

    print('Digite o ID do card que deseja excluir: ');
    var id = int.tryParse(stdin.readLineSync());
    if (await cardServ.deletarCard(id)) {
      print('Card excluído com sucesso.');
    } else {
      print('Não foi possível excluir o card.');
    }
  }
}
