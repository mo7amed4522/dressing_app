class OrderRentModel {
  String? status;
  String? msg;
  List<DataOrderRentModel>? data;

  OrderRentModel({this.status, this.msg, this.data});

  OrderRentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DataOrderRentModel>[];
      json['data'].forEach((v) {
        data!.add(DataOrderRentModel.fromJson(v));
      });
    }
  }
}

class DataOrderRentModel {
  int? orderRentID;
  String? createdAt;
  String? updateAt;
  int? prodID;
  int? userID;
  int? collectionId;
  int? amount;
  int? totalPrice;
  int? payNow;
  String? endAt;

  DataOrderRentModel({this.orderRentID, this.createdAt, this.updateAt, this.prodID, this.userID, this.collectionId, this.amount, this.totalPrice, this.payNow, this.endAt});

  DataOrderRentModel.fromJson(Map<String, dynamic> json) {
    orderRentID = json['orderRentID'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
    prodID = json['prod_ID'];
    userID = json['user_ID'];
    collectionId = json['collection_id'];
    amount = json['amount'];
    totalPrice = json['total_price'];
    payNow = json['pay_now'];
    endAt = json['end_at'];
  }
}
