import 'package:injectable/injectable.dart';
import 'package:product_catelog_app/main.export.dart';

export 'package:dio/dio.dart';

@Singleton(order: -1)
class DioClient {
  DioClient() {
    _dio = Dio(_options);
  }

  late Dio _dio;

  Dio get dio => _dio;

  final _options = BaseOptions(
    baseUrl: Endpoints.clientApi,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    sendTimeout: const Duration(seconds: 5),
    headers: {'Accept': 'application/json'},
  );
}
