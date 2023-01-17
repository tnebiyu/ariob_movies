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
        const ModifiedText(text: "Trending Movies", size: 26,),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: trending!.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 140,
                    child:Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending![index]['poster_path']),)

                          ),
height: 200,
                        ),
                        SizedBox(height: 5,),

                        ModifiedText(
                        size: 15,
                        text: trending![index]['title'] != null
                        ? trending![index]['title']
                            : 'Loading')

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
