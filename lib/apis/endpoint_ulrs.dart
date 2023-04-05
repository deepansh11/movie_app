import '../apis/api_constant.dart';

class Endpoints {
  static String getPopularUrl(int page) {
    return '/movie/popular?api_key='
        '$TMDB_API_KEY'
        '&include_adult=false&page=$page';
  }

  static String getUpcomingUrl(int page) {
    return '/movie/upcoming?api_key='
        '$TMDB_API_KEY'
        '&include_adult=false&page=$page';
  }

  static String topRatedUrl(int page) {
    return '/movie/top_rated?api_key='
        '$TMDB_API_KEY'
        '&include_adult=false&page=$page';
  }

  static String getTrailerKey(int movieId) {
    return '/movie/$movieId/videos?api_key='
        '$TMDB_API_KEY';
  }
}
