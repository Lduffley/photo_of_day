import 'dart:convert';

import 'package:http/http.dart';
import 'package:nasa1_app/model/Nasa_model.dart';

const apiKey = 'FVLxdkasEXkXZkvcj6lXCLRFS6QcTd3vJWqNX3uC';

class Network {
  Future<NasaModel> getNasaData({String date}) async {
    var finalURL =
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$date';

    final response = await get(Uri.encodeFull(finalURL));

    print('Url ${Uri.encodeFull(finalURL)}');

    if (response.statusCode == 200) {
      print(response.body);
      return NasaModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting NASA data');
    }
  }
}
