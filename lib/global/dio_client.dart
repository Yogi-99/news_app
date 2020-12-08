import 'package:dio/dio.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: KBaseUrl,
      headers: {
        'Authorization': 'Bearer ${LocalState.signedInUserToken}',
      },
    ),
  );
}
