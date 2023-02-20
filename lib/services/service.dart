import 'package:tmdb_api/tmdb_api.dart';
import 'package:ariob_movies/secret/api.dart' as secret;
class MovieModel {
  final  String apiKey =secret.themoviedbApiKey;
  final  String accessToken = secret.accessToken;
  List? trendingMovies = [];
  List? topRatedMovies = [];
  List? tv = [];
  Future loadMovies() async{
    TMDB tmdbWithCustomLog = TMDB(ApiKeys(apiKey, accessToken, ), logConfig:const ConfigLogger(showLogs: true, showErrorLogs: true,));
    Map trendingResults = await tmdbWithCustomLog.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLog.v3.movies.getTopRated();
    Map tvReuslts = await tmdbWithCustomLog.v3.tv.getPopular();
    trendingMovies = trendingResults['results'];
    topRatedMovies = topRatedResults['results'];
    tv = tvReuslts['results'];




  }
}