import 'package:flutter/material.dart';
import 'package:nasa1_app/model/Nasa_model.dart';

Widget midView(AsyncSnapshot<NasaModel> snapshot) {
  var title = snapshot.data.title;
  var explanation = snapshot.data.explanation;
  var url = snapshot.data.hdurl;
  var copyright = snapshot.data.copyright;

  Container midView = Container(
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('$title'),
          SizedBox(
            height: 20,
          ),
          Image(image: NetworkImage(url)),
          SizedBox(
            height: 20,
          ),
          Text(
            '$explanation',
          )
        ],
      ),
    ),
  );

  return midView;
}
