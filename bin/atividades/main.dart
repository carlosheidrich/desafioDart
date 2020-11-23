import 'package:dio/dio.dart';

var dio =
    Dio(BaseOptions(baseUrl: 'http://jsonplaceholder.typicode.com/comments/'));

void main() async {
  try {
    var resp = await dio.post('posts');
    print('O retorno foi: $resp');
  } on DioError catch (e) {
    print('Ocorreu um erro: ${e.message}');
  }
}
