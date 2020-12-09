import 'package:dio/dio.dart';
import 'package:news_app/global/constants/api_key.dart';

import 'constants/endpoints.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: KBaseUrl,
      queryParameters: {'apiKey': KApiKey},
    ),
  );
}
