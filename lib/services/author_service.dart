import 'package:dio/dio.dart';

import '../global/constants/endpoints.dart';
import '../global/custom_response.dart';

class AuthService {
  Future<CustomResponse<String>> getRandomAuthorImage() async {
    try {
      Response response =
          await Dio().get(KRandomUserUrl, queryParameters: {'results': 1});

      String image = (response.data['results'] as List)[0]['picture']['medium'];

      return CustomResponse.completed(image);
    } on DioError catch (dioError) {
      return CustomResponse.error(dioError.message);
    } catch (e) {
      return CustomResponse.error('Something went wrong');
    }
  }
}
