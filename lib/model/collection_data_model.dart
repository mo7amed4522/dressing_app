class CollectionDataModel {
  String? status;
  String? msg;
  List<DataCollectionList>? data;

  CollectionDataModel({this.status, this.msg, this.data});

  CollectionDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DataCollectionList>[];
      json['data'].forEach((v) {
        data!.add(DataCollectionList.fromJson(v));
      });
    }
  }
}

class DataCollectionList {
  int? colId;
  String? collectionName;
  String? photo;
  String? description;
  int? rate;
  String? nameProduct1;
  String? nameProduct2;
  String? nameProduct3;
  String? nameProduct4;
  String? nameProduct5;
  String? nameProduct6;
  String? nameProduct7;
  String? nameProduct8;
  String? nameProduct9;
  String? nameProduct10;
  int? isShow;
  int? price1;
  int? price2;

  DataCollectionList({this.colId, this.collectionName, this.photo, this.description, this.rate, this.nameProduct1, this.nameProduct2, this.nameProduct3, this.nameProduct4, this.nameProduct5, this.nameProduct6, this.nameProduct7, this.nameProduct8, this.nameProduct9, this.nameProduct10, this.isShow, this.price1, this.price2});

  DataCollectionList.fromJson(Map<String, dynamic> json) {
    colId = json['col_id'];
    collectionName = json['collection_name'];
    photo = json['photo'];
    description = json['description'];
    rate = json['rate'];
    nameProduct1 = json['nameProduct1'];
    nameProduct2 = json['nameProduct2'];
    nameProduct3 = json['nameProduct3'];
    nameProduct4 = json['nameProduct4'];
    nameProduct5 = json['nameProduct5'];
    nameProduct6 = json['nameProduct6'];
    nameProduct7 = json['nameProduct7'];
    nameProduct8 = json['nameProduct8'];
    nameProduct9 = json['nameProduct9'];
    nameProduct10 = json['nameProduct10'];
    isShow = json['is_show'];
    price1 = json['price_1'];
    price2 = json['price_2'];
  }
}
