import 'dart:io';
import 'src/controlers/cardController.dart';

void main() async {
  var opcao = 0;
  var controller = CardController();

  do {
    opcao = 0;
    print('\n============================================');
    print('Bem-vindo ao sistema de Cards o/');
    print('\nEscolha uma das opções abaixo: ');
    print('1 - Buscar todos os cards');
    print('2 - Buscar card pelo ID');
    print('3 - Criar card');
    print('4 - Atualizar card');
    print('5 - Deletar card');
    print('6 - Sair');

    opcao = int.tryParse(stdin.readLineSync());

    switch (opcao) {
      case 1: //Buscar todos os cards
        await controller.carregaCards();
        break;
      case 2: //Buscar card pelo ID
        await controller.buscarCardId();
        break;
      case 3: //Criar card
        await controller.salvarCard();
        break;
      case 4: //Atualizar card
        await controller.atualizarCard();
        break;
      case 5: //Deletar card
        await controller.deletarCard();
        break;
      case 6: //Sair
        print('===========================');
        print('Saíndo do sistema....');
        print('Valeu, falows !');
        print('===========================');
        break;
      default:
        print('Opção inválida.');
        
    }
  } while (!(opcao == 6));
}
