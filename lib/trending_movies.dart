import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:flutter/material.dart';
class TrendingMovies extends StatelessWidget {
  final List? trending;



  const TrendingMovies({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(text: "Trending Movies", size: 26,color: Colors.white,),
        const SizedBox(height: 10,),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: trending!.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child:Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending![index]['backdrop_path']),)

                          ),
height: 140,
                        ),
                        const SizedBox(height: 8,),

                        Column(
                          children:[ ModifiedText(
                          size: 15,
                          text: trending![index]['title'] ?? 'Loading', color: Colors.white,
                         ),

                     ]   ),

                      ],
                    ) ,
                  ),

                );


              }),
        )
      ],
    );
  }
}
