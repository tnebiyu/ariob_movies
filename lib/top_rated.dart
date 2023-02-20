import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:flutter/material.dart';

import 'utils/constants.dart';
import 'description.dart';
class TopRatedMovies extends StatelessWidget {
  final List? topRated;



  const TopRatedMovies({Key? key, this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(text: kTopRated, size: 26,color: ktextColor),
        const SizedBox(height: 10,),
        SizedBox(
          height: 270,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated!.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>

                        DescriptionPage(name: topRated![index]['title'],
                          description: topRated![index]['overview'],
                          bannerurl: kThemoviedbImageURLw500 + topRated![index]['backdrop_path'],

                          posturl: kThemoviedbImageURLw500 + topRated![index]['poster_path'],
                          vote: topRated![index]['vote_average'].toString(),
                          launchon: topRated![index]['release_date'],

                        )));

                  },
                  child:topRated![index]['title'] !=null ?  Container(
                    padding: const EdgeInsets.all(2),
                    width: 140,
                    child:Column(
                      children: [
                        Container(

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(image: NetworkImage(
                                  kThemoviedbImageURLw500 +
                                      topRated![index]['poster_path']),)

                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5,),

                        ModifiedText(
                          size: 15,
                          text: topRated![index]['original_title'] ?? 'Loading', color: ktextColor),

                      ],
                    ) ,
                  ) : Container(),

                );


              }),
        )
      ],
    );
  }
}
