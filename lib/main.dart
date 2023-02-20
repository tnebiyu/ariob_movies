import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:ariob_movies/services/service.dart' as service;
import 'package:ariob_movies/top_rated.dart';
import 'package:ariob_movies/trending_movies.dart';
import 'package:flutter/material.dart';
import 'package:ariob_movies/tv.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}
class _MyAppState extends State<MyApp> {
  @override void initState(){

   super.initState();}

  @override
  Widget build(BuildContext context) {
   var movies = service.MovieModel();

    return  MaterialApp(
      title: 'Ariob Movies',
debugShowCheckedModeBanner: false,

home: Scaffold(
  backgroundColor: Colors.black,
  appBar: AppBar(
    backgroundColor: Colors.black,
    title: const ModifiedText(text: 'Ariob Movies', size: 35,),
  ),
  body: ListView(

    children:  [
      TrendingMovies(trending: movies.trendingMovies,),
      TopRatedMovies(topRated: movies.topRatedMovies,),
      TvShow(tv: movies.tv,),





    ],
  ) ,
)
          );
  }
}

