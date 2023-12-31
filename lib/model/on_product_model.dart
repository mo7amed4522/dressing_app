// ignore_for_file: unnecessary_new

class OneProductModel {
  String? status;
  String? msg;
  DataProductModel? data;

  OneProductModel({this.status, this.msg, this.data});

  OneProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? DataProductModel.fromJson(json['data']) : null;
  }
}

class DataProductModel {
  int? prodId;
  String? name;
  String? description;
  int? rate;
  int? price1;
  int? price2;
  int? price3;
  int? price4;
  int? depID;
  int? isShow;
  int? amount;
  List<ColorProd>? color;
  List<Photos>? photos;
  List<Size>? size;

  DataProductModel({this.prodId, this.name, this.description, this.rate, this.price1, this.price2, this.price3, this.price4, this.depID, this.isShow, this.amount, this.color, this.photos, this.size});

  DataProductModel.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    name = json['name'];
    description = json['description'];
    rate = json['rate'];
    price1 = json['price_1'];
    price2 = json['price_2'];
    price3 = json['price_3'];
    price4 = json['price_4'];
    depID = json['dep_ID'];
    isShow = json['is_show'];
    amount = json['amount'];
    if (json['color'] != null) {
      color = <ColorProd>[];
      json['color'].forEach((v) {
        color!.add(ColorProd.fromJson(v));
      });
    }
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    if (json['size'] != null) {
      size = <Size>[];
      json['size'].forEach((v) {
        size!.add(Size.fromJson(v));
      });
    }
  }
}

class ColorProd {
  int? colorId;
  String? colorName;
  int? prodId;

  ColorProd({this.colorId, this.colorName, this.prodId});

  ColorProd.fromJson(Map<String, dynamic> json) {
    colorId = json['color_id'];
    colorName = json['color_name'];
    prodId = json['prod_id'];
  }
}

class Photos {
  int? imageId;
  String? imageUrl;
  int? prodId;

  Photos({this.imageId, this.imageUrl, this.prodId});

  Photos.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    imageUrl = json['image_url'];
    prodId = json['prod_id'];
  }
}

class Size {
  int? sizeId;
  String? sizeType;
  int? prodId;

  Size({this.sizeId, this.sizeType, this.prodId});

  Size.fromJson(Map<String, dynamic> json) {
    sizeId = json['size_id'];
    sizeType = json['size_type'];
    prodId = json['prod_id'];
  }
}
