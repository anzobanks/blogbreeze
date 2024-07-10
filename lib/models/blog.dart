// To parse this JSON data, do
//
//     final blog = blogFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';

List<Blog> blogFromJson(String str) => List<Blog>.from(json.decode(str).map((x) => Blog.fromJson(x)));

String blogToJson(List<Blog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Blog {
    String id;
    String title;
    String subTitle;
    String body,image;
    DateTime dateCreated;
    RxBool isFavorite;

    Blog({
        required this.id,
        required this.title,
        required this.subTitle,
        required this.body,
        required this.isFavorite,
        required this.image,
        required this.dateCreated,
    });

    factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        title: json["title"],
        subTitle: json["subTitle"],
        body: json["body"],
        isFavorite: false.obs,
        image:images[ Random().nextInt(images.length)],
        dateCreated: DateTime.parse(json["dateCreated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "body": body,
        "dateCreated": dateCreated.toIso8601String(),
    };
}


List<String> images =[
  'https://i.pinimg.com/736x/7e/fd/3b/7efd3b6a1b4c91a9f09a9cb250d25703.jpg',
  'https://i.pinimg.com/564x/b0/49/5e/b0495ee0710cb769a8b2b74a2d605e47.jpg',
  'https://i.pinimg.com/736x/25/ea/a1/25eaa1648faaa8a10a422df60c6fd676.jpg',
  'https://i.pinimg.com/736x/ad/ee/76/adee76dcfbdec182a82cecf7b0e7f891.jpg',
  'https://i.pinimg.com/736x/08/80/99/08809940d40530bfdb457d7a60466657.jpg',
  'https://i.pinimg.com/736x/f1/e0/a0/f1e0a0dea1698b6cdd481ea937f5de1f.jpg',
  'https://i.pinimg.com/564x/29/31/da/2931dae36fbd6112c48d6ee32a3b1823.jpg','https://i.pinimg.com/736x/81/b7/8b/81b78b1de47ae84672cb07b33c7f66d6.jpg',
  'https://i.pinimg.com/564x/90/01/26/90012644dbdff017779228eefbf7c5fc.jpg','https://i.pinimg.com/736x/b7/fd/9e/b7fd9e1c2b33a6906c3cf5d152a2aae7.jpg',
  'https://i.pinimg.com/736x/38/fb/65/38fb65e4b979f73d76d686d48527320e.jpg'
];