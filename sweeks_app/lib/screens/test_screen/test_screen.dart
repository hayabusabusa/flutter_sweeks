import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sweeks_app/models/models.dart';
import 'package:sweeks_app/repositories/repositories.dart';

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final repository = SweeksRepository(
    sweeksApiClient: SweeksApiClient(
      httpClient: http.Client()
    )
  );

  Widget _buildGridItem(Toriko toriko) {
    if (toriko.image != null) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(toriko.image),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.grey[200],
        child: Center(
          child: Icon(Icons.broken_image),
        ),
      );
    }
  }

  Widget _buildGridView(BuildContext context, AsyncSnapshot snapshot) {
    final Torikos torikos = snapshot.data;

    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        torikos.items.length,
        (index) {
          return _buildGridItem(torikos.items[index]);
        })
      ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST'),
      ),
      body: FutureBuilder(
        future: repository.getSweetsWithMax(42),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if (snapshot.hasData) {
            return _buildGridView(context, snapshot);
          } else if (snapshot.hasError) {
            return Center(
                child: Text(snapshot.error),
              );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}