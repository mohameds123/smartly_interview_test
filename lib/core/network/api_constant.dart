class ApiConstance {
  ///Movie Links
  static const String baseUrl ='https://api.themoviedb.org/3';

  static const String apikey = "87903828b97a85b50c60fb3bbd960c55";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apikey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apikey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apikey";

  static const String baseImageUrl ='https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) =>'$baseImageUrl$path';

  static String movieDetailsPath(int movieId)=>'$baseUrl/movie/$movieId?api_key=$apikey';

  static String recommendationPath(int movieId)=>'$baseUrl/movie/$movieId/recommendations?api_key=$apikey';


  ///TV Links
  static const String onTheAirTvPath = '$baseUrl/tv/on_the_air?api_key=$apikey';
  static const String popularTvPath = '$baseUrl/tv/popular?api_key=$apikey';
  static const String topRatedTvPath = '$baseUrl/tv/top_rated?api_key=$apikey';
  static String tvDetailsPath(int tvId)=>'$baseUrl/tv/$tvId?api_key=$apikey';
}
