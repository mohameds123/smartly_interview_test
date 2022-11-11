class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apikey = "93b8d132728a1fa03841d4781ed9f3e7";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apikey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apikey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apikey";

  static const String baseImageUrl ='https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) =>'$baseImageUrl$path';

  static String movieDetailsPath(int movieId)=>'$baseUrl/movie/$movieId?api_key=$apikey';

  static String recommendationPath(int movieId)=>'$baseUrl/movie/$movieId/recommendation?api_key=$apikey';
}
