class FirstProductModel {
  String? status;
  String? msg;
  List<DataFirstProfuctModel>? data;

  FirstProductModel({this.status, this.msg, this.data});

  FirstProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DataFirstProfuctModel>[];
      json['data'].forEach((v) {
        data!.add(DataFirstProfuctModel.fromJson(v));
      });
    }
  }
}

class DataFirstProfuctModel {
  int? prodId;
  String? name;
  String? image;

  DataFirstProfuctModel({this.prodId, this.name, this.image});

  DataFirstProfuctModel.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    name = json['name'];
    image = json['image'];
  }
}
