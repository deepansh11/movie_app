import 'package:dio/dio.dart';

import '../apis/api_constant.dart';

class BaseService {
  final dio = Dio(
    BaseOptions(
      baseUrl: TMDB_API_BASE_URL,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "Origin,Content-Type",
        "Access-Control-Allow-Methods": "GET,POST,HEAD,OPTIONS,PUT,DELETE",
        "Content-Type": "application/json",
      },
    ),
  );

  final dioError = DioError(requestOptions: RequestOptions());
}
