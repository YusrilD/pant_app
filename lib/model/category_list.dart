import 'package:flutter_plant_app/model/image_detail_model.dart';

//Todo : Tambah ID

class CategoryList {
  String? image;
  String? title;
  String? description;
  int? price;
  String? type;
  List<ImageList>? imageList = [];

  CategoryList(
      {this.image,
      this.title,
      this.description,
      this.price,
      this.type,
      this.imageList});

  CategoryList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    type = json['type'];
    imageList = json['imageList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['type'] = this.type;
    data['imageList'] = this.imageList;
    return data;
  }
}
