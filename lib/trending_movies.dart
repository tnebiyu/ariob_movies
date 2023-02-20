import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:ariob_movies/utils/constants.dart';
import 'package:ariob_movies/description.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List? trending;

  const TrendingMovies({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModifiedText(text: kTrending, size: 26, color: ktextColor),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                                  name: trending![index]['title'],
                                  description: trending![index]['overview'],
                                  bannerurl: kThemoviedbImageURLw500 +
                                      trending![index]['backdrop_path'],
                                  posturl: kThemoviedbImageURLw500 +
                                      trending![index]['poster_path'],
                                  vote: trending![index]['vote_average']
                                      .toString(),
                                  launchon: trending![index]['release_date'],
                                )));
                  },
                  child: trending![index]['title'] != null
                      ? Container(
                          padding: const EdgeInsets.all(5),
                          width: 250,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          kThemoviedbImageURLw500 +
                                              trending![index]
                                                  ['backdrop_path']),
                                    )),
                                height: 140,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Column(children: [
                                ModifiedText(
                                  size: 15,
                                  text: trending![index]['title'] ?? 'Loading',
                                  color: ktextColor,
                                ),
                              ]),
                            ],
                          ),
                        )
                      : Container(),
                );
              }),
        )
      ],
    );
  }
}
