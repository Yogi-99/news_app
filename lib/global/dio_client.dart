import 'package:dio/dio.dart';

import 'constants/endpoints.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: KBaseUrl,
      headers: {},
    ),
  );
}
