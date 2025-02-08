import 'Images.dart';
import 'product_comp_extra.dart';
import 'Notes.dart';
import 'Groups.dart';
import 'Sizes.dart';

class Product {
  Product({
      this.id, 
      this.name, 
      this.barcode, 
      this.desc, 
      this.images, 
      this.comprehensiveExtras, 
      this.notes, 
      this.groups, 
      this.sizes,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    barcode = json['barcode'];
    desc = json['desc'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    if (json['comprehensive_extras'] != null) {
      comprehensiveExtras = [];
      json['comprehensive_extras'].forEach((v) {
        comprehensiveExtras?.add(ProductCompExtra.fromJson(v));
      });
    }
    if (json['notes'] != null) {
      notes = [];
      json['notes'].forEach((v) {
        notes?.add(Notes.fromJson(v));
      });
    }
    if (json['groups'] != null) {
      groups = [];
      json['groups'].forEach((v) {
        groups?.add(Groups.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        sizes?.add(Size.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  String? barcode;
  String? desc;
  List<Images>? images;
  List<ProductCompExtra>? comprehensiveExtras;
  List<Notes>? notes;
  List<Groups>? groups;
  List<Size>? sizes;
Product copyWith({  num? id,
  String? name,
  String? barcode,
  String? desc,
  List<Images>? images,
  List<ProductCompExtra>? comprehensiveExtras,
  List<Notes>? notes,
  List<Groups>? groups,
  List<Size>? sizes,
}) => Product(  id: id ?? this.id,
  name: name ?? this.name,
  barcode: barcode ?? this.barcode,
  desc: desc ?? this.desc,
  images: images ?? this.images,
  comprehensiveExtras: comprehensiveExtras ?? this.comprehensiveExtras,
  notes: notes ?? this.notes,
  groups: groups ?? this.groups,
  sizes: sizes ?? this.sizes,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['barcode'] = barcode;
    map['desc'] = desc;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (comprehensiveExtras != null) {
      map['comprehensive_extras'] = comprehensiveExtras?.map((v) => v.toJson()).toList();
    }
    if (notes != null) {
      map['notes'] = notes?.map((v) => v.toJson()).toList();
    }
    if (groups != null) {
      map['groups'] = groups?.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      map['sizes'] = sizes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}