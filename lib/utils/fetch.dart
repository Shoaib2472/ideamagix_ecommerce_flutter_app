import 'package:dio/dio.dart';
import 'package:ideamagix_ecommerce_flutter_app/utils/env.dart';

class Fetch {
  final String _apiHost = Env.getString('API_HOST');
  final int _apiPort = Env.getInt('API_PORT');
  final String _apiScheme = Env.getString('API_SCHEME');

  final dio = Dio();

 Future<String?> get(
  {
    required String path,
  }
 ) async {}
 Future<String?> post(
  {
    required String path
  }
 ) async{}
 Future<String?> put(
  {
    required String path
  }
 ) async{}
 Future<String?> patch(
  {
    required String path
  }
 ) async{}
 Future<String?> delete(
  {
    required String path
  }
 ) async{}
}
