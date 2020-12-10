import 'package:dio/dio.dart';

import '../global/constants/endpoints.dart';
import '../global/custom_response.dart';
import '../global/dio_client.dart';
import '../model/article.dart';
import '../model/source.dart';

class ArticleService {
  Future<CustomResponse<List<Article>>> getTopHeadlines() async {
    try {
      Response response = await DioClient.dio
          .get(KTopHeadlinesEndpoint, queryParameters: {'country': 'in'});

      return CustomResponse.completed((response.data['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList());
    } on DioError catch (dioError) {
      if (dioError.response.statusCode == 429 &&
          dioError.response.data['code'] == 'rateLimited') {
        return CustomResponse.error(
            'You have made too many requests, try after 12 hours.');
      }
      return CustomResponse.error(dioError.message);
    } catch (e) {
      return CustomResponse.error('Something went wrong');
    }
  }

  Future<CustomResponse<List<Article>>> getExploreArticles(
      Source source) async {
    try {
      Response response = await DioClient.dio
          .get(KEverythingEndpoint, queryParameters: {'sources': source.id});

      return CustomResponse.completed((response.data['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList());
    } on DioError catch (dioError) {
      if (dioError.response.statusCode == 429 &&
          dioError.response.data['code'] == 'rateLimited') {
        return CustomResponse.error(
            'You have made too many requests, try after 12 hours.');
      }
      return CustomResponse.error(dioError.message);
    } catch (e) {
      return CustomResponse.error('Something went wrong');
    }
  }

  Future<CustomResponse<List<Article>>> searchArticles(String searchTerm,
      [Source source]) async {
    try {
      Map<String, dynamic> queryParameters;
      if (source == null) {
        queryParameters = {'q': searchTerm};
      } else {
        queryParameters = {'q': searchTerm, 'sources': source.id};
      }

      Response response = await DioClient.dio
          .get(KEverythingEndpoint, queryParameters: queryParameters);

      return CustomResponse.completed((response.data['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList());
    } on DioError catch (dioError) {
      if (dioError.response.statusCode == 429 &&
          dioError.response.data['code'] == 'rateLimited') {
        return CustomResponse.error(
            'You have made too many requests, try after 12 hours.');
      }
      return CustomResponse.error(dioError.message);
    } catch (e) {
      return CustomResponse.error('Something went wrong');
    }
  }
}
