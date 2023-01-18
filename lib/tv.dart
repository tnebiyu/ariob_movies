import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:flutter/material.dart';
class TvPage extends StatelessWidget {
  final List? tv;



  const TvPage({Key? key, this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(text: "Popular Tv Shows Movies", size: 26,color: Colors.white,),
        const SizedBox(height: 10,),
        SizedBox(
          height: 270,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv!.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: () {

                  },
                  child: SizedBox(
                    width: 140,
                    child:Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tv![index]['backdrop_path']),)

                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5,),

                        ModifiedText(
                          size: 15,
                          text: tv![index]['original_name'] ?? 'Loading', color: Colors.white,),

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
