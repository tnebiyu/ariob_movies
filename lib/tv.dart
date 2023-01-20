import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:flutter/material.dart';

import 'description.dart';
class TvShow extends StatelessWidget {
  final List ?tv;



  const TvShow({Key? key, this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(text: "Popular Tv Shows", size: 26,color: Colors.white,),
        const SizedBox(height: 10,),
        SizedBox(
          height: 270,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv!.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>

                        DescriptionPage(name: tv![index]['title'],
                          description: tv![index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' + tv![index]['backdrop_path'],

                          posturl: 'https://image.tmdb.org/t/p/w500' + tv![index]['poster_path'],
                          vote: tv![index]['vote_average'].toString(),
                          launchon: tv![index]['release_date'],

                        )));

                  },
                  child: Container(
                    width: 140,
                    padding: const EdgeInsets.all(12),
                    child:Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 200,

                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tv![index]['poster_path'] ))

                          ),

                        ),
                    const SizedBox(height: 5,),

                        Column(
                            children:[ ModifiedText(
                              size: 15,
                              text: tv![index]['original_name'] ?? 'Loading', color: Colors.white,
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
