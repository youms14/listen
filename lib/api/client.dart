import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.options.baseUrl = 'http://localhost:3000/';
    return _dio;
  }

  Client() {
    init();
  }
}
