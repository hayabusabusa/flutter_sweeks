import 'dart:async';
import 'package:meta/meta.dart';
import 'package:sweeks_app/repositories/sweeks_api_client.dart';
import 'package:sweeks_app/models/models.dart';

class SweeksRepository {
  final SweeksApiClient sweeksApiClient;

  SweeksRepository({
    @required this.sweeksApiClient
  }) : assert(sweeksApiClient != null);

  Future<Torikos> getSweetsWithMax(int max) async {
    return await sweeksApiClient.getSweetsWithMax(max);
  }
}