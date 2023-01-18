import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:flutter/material.dart';
class TopRatedMovies extends StatelessWidget {
  final List? topRated;



  const TopRatedMovies({Key? key, this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(text: "Top Rated Movies", size: 26,color: Colors.white,),
        const SizedBox(height: 10,),
        SizedBox(
          height: 270,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated!.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    width: 140,
                    child:Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      topRated![index]['poster_path']),)

                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5,),

                        ModifiedText(
                          size: 15,
                          text: topRated![index]['original_title'] ?? 'Loading', color: Colors.white,),

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
