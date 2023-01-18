import 'package:ariob_movies/Widget/modified_text.dart';
import 'package:flutter/material.dart';
class DescriptionPage extends StatelessWidget {
  final String? name, description, bannerurl, posturl, vote, launchon;
  const DescriptionPage({Key? key, this.name,  this.description,  this.bannerurl,  this.posturl, this.vote, this.launchon,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl!, fit: BoxFit.cover,),
                  )),
                  Positioned(
                      bottom: 10,
                      child: ModifiedText(
                    text: '  ⭐ Average rating ' + vote!,size: 18,
                        color: Colors.white,
                  ))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(text: name ?? 'Not Loaded!',color: Colors.white,),),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: 'Releasing on ' + launchon!, size: 14,color: Colors.white,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.network(posturl!),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(text: description, size: 18,color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
