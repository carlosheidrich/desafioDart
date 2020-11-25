import 'package:dio/dio.dart';
import '../entities/card.dart';

var dio = Dio(BaseOptions(baseUrl: 'https://api-cards-growdev.herokuapp.com'));

class CardService {
  //2.1.1 Criar método para recuperar todos os cards
  Future<bool> carregarCards() async {
    try {
      var resp = await dio.get('/cards');

      if (resp.statusCode == 200) {
        if ((resp.data as List).length > 0) {
          print('Cards encontrados:\n${resp.data}');
          return true;
        } else {
          print('Não foram encontrados cards na API.');
          return false;
        }
      } else {
        return false;
      }
    } on DioError catch (e) {
      print('Ocorreu um erro: ${e.message}');
      return false;
    }
  }

  //2.1.2 Criar método para recuperar card por id
  Future<bool> buscarCardId(int id) async {
    try {
      var resp = await dio.get('/cards/$id');
      if (resp.statusCode == 200) {
        print(resp.data);
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      if (e.message != 'Http status error [404]') {
        print('Ocorreu um erro: ${e.message}');
      }
      return false;
    }
  }

  //2.1.3 Criar método para salvar card
  Future<bool> salvarCard(Card card) async {
    try {
      var resp = await dio.post('/cards', data: card.toJson());
      if (resp.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print('Ocorreu um erro: ${e.message}');
      return false;
    }
  }

  //2.1.4 Criar método para atualizar card
  Future<bool> atualizarCard(Card card) async {
    try {
      var resp = await dio.put('/cards/${card.id}', data: card.toJson());
      if (resp.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print('Ocorreu um erro: ${e.message}');
      return false;
    }
  }

  //2.1.5 Criar método para deletar card
  Future<bool> deletarCard(int id) async {
    try {
      var resp = await dio.delete('/cards/$id');
      if (resp.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      if (e.message != 'Http status error [404]') {
        print('Ocorreu um erro: ${e.message}');
      } else {
        print('Card não encontrado.');
      }
      return false;
    }
  }
}
