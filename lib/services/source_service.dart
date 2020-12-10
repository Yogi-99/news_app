import 'package:dio/dio.dart';
import 'package:news_app/global/constants/endpoints.dart';
import 'package:news_app/global/custom_response.dart';
import 'package:news_app/global/dio_client.dart';
import 'package:news_app/model/source.dart';

class SourceService {
  Future<CustomResponse<List<Source>>> getAllSources() async {
    try {
      Response response = await DioClient.dio.get(KSourcesEndpoint);

      return CustomResponse.completed((response.data['sources'] as List)
          .map((e) => Source.fromJson(e))
          .toList());
    } on DioError catch (dioError) {
      return CustomResponse.error(dioError.message);
    } catch (e) {
      return CustomResponse.error('Something went wrong');
    }
  }
}
