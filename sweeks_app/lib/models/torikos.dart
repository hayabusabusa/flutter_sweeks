import 'package:equatable/equatable.dart';

class Torikos extends Equatable {
  final List<Toriko> items;

  Torikos(
    this.items
  ) : super([items]);

  factory Torikos.fromJson(Map<String, dynamic> persedJson) {
    var items = persedJson['item'] as List;
    return Torikos(items.map((i) => Toriko.fromJson(i)).toList());
  }
}

class Toriko extends Equatable {
  final String id;
  final String name;
  final String maker;
  //final String price; // Optional
  //final TorikoType type;
  final String url;
  //final List<TorikoTag> tags;
  final String image; // Optional
  final String comment;

  Toriko({
    this.id,
    this.name,
    this.maker,
    this.url,
    this.image,
    this.comment
  }) : super([
      id,
      name,
      maker,
      url,
      image,
      comment,
    ]);

  factory Toriko.fromJson(Map<String, dynamic> persedJson) {
    return Toriko(
      id: persedJson['id'],
      name: persedJson['name'],
      maker: persedJson['maker'],
      url: persedJson['url'],
      image: persedJson['image'],
      comment: persedJson['comment'],
    );
  }
}