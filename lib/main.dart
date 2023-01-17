import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:ariob_movies/trending_movies.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final  String apiKey = 'ddfa134d1913d074c2bc8742a47a261e';
  final  String accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZGZhMTM0ZDE5MTNkMDc0YzJiYzg3NDJhNDdhMjYxZSIsInN1YiI6IjYzYzY3MzBlNjZhZTRkMDA4NWNiNTQ4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MRveBb2ThFDt7I3QGIXR920UbLoMkSEaHbZm10MI4p0';
 Future loadMovies() async{
   TMDB tmdbWithCustomLog = TMDB(ApiKeys(apiKey, accessToken, ), logConfig:const ConfigLogger(showLogs: true, showErrorLogs: true,));
   Map trendingResults = await tmdbWithCustomLog.v3.trending.getTrending();
   Map topRatedResults = await tmdbWithCustomLog.v3.movies.getTopRated();
   Map tvReuslts = await tmdbWithCustomLog.v3.tv.getPopular();


   setState(() {
  trendingMovies = trendingResults["results"];
  topRatedMovies = topRatedResults["reuslts"];
  tv = tvReuslts["results"];

});
 }
  @override void initState(){
   loadMovies();
   super.initState();}

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Ariob Movies',

home: Scaffold(
  appBar: AppBar(
    title: ModifiedText(text: 'Ariob Movies', size: 35,),
  ),
  body: ListView(

    children:  [
      TrendingMovies(
        trending: trendingMovies,

      )
    ],
  ) ,
)
          );
  }
}

