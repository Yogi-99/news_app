import 'package:dio/dio.dart';
import 'package:news_app/global/constants/endpoints.dart';
import 'package:news_app/global/custom_response.dart';
import 'package:news_app/global/dio_client.dart';
import 'package:news_app/model/article.dart';

class ArticleService {
  Future<CustomResponse<List<Article>>> getTopHeadlines() async {
    try {
      Response response = await DioClient.dio
          .get(KTopHeadlinesEndpoint, queryParameters: {'country': 'in'});

      return CustomResponse.completed((response.data['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList());
    } on DioError catch (dioError) {
      return CustomResponse.error(dioError.message);
    } catch (e) {
      return CustomResponse.error('Something went wrong');
    }
  }

  Future<CustomResponse<List<Article>>> searchArticles(
      String searchTerm) async {
    try {
      Response response = await DioClient.dio
          .get(KTopHeadlinesEndpoint, queryParameters: {'q': searchTerm});

      return CustomResponse.completed((response.data['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList());
    } on DioError catch (dioError) {
      return CustomResponse.error(dioError.message);
    } catch (e) {
      return CustomResponse.error('Something went wrong');
    }
  }
}
