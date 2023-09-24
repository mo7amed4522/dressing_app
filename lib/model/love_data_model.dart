class LoveModel {
  String? status;
  String? msg;
  List<Data>? data;

  LoveModel({this.status, this.msg, this.data});

  LoveModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? prodId;
  String? name;
  String? image;
  int? rate;

  Data({this.prodId, this.name, this.image, this.rate});

  Data.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    name = json['name'];
    image = json['image'];
    rate = json['rate'];
  }
}
