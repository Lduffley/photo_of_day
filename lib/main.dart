import 'package:flutter/material.dart';
import 'package:nasa1_app/model/Nasa_model.dart';
import 'package:nasa1_app/network/network.dart';
import 'package:nasa1_app/ui/mid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NasaAPOD(),
    );
  }
}

class NasaAPOD extends StatefulWidget {
  @override
  _NasaAPODState createState() => _NasaAPODState();
}

class _NasaAPODState extends State<NasaAPOD> {
  Future<NasaModel> forecastObject;
  String date = '2020-07-25';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getNasa(date: date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nasa Photo of the Day'),
      ),
      body: ListView(
        children: <Widget>[
          textFieldSearch(),
          Container(
            child: FutureBuilder<NasaModel>(
              future: forecastObject,
              builder:
                  (BuildContext context, AsyncSnapshot<NasaModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[midView(snapshot)],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldSearch() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter Date to Search YYYY-MM-DD',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onSubmitted: (value) {
          setState(() {
            date = value;
            forecastObject = getNasa(date: date);
          });
        },
      ),
    );
  }

  Future<NasaModel> getNasa({String date}) =>
      new Network().getNasaData(date: date);
}
