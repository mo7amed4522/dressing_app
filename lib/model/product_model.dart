class ProductModel {
  String? status;
  String? msg;
  List<ProductData>? data;

  ProductModel({this.status, this.msg, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
  }
}

class ProductData {
  int? prodId;
  String? name;
  String? photo;
  String? description;
  int? rate;
  int? price1;
  int? price2;
  int? price3;
  int? price4;
  String? size;
  int? depID;
  int? isShow;
  int? amount;

  ProductData(
      {this.prodId,
      this.name,
      this.photo,
      this.description,
      this.rate,
      this.price1,
      this.price2,
      this.price3,
      this.price4,
      this.size,
      this.depID,
      this.isShow,
      this.amount});

  ProductData.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    rate = json['rate'];
    price1 = json['price_1'];
    price2 = json['price_2'];
    price3 = json['price_3'];
    price4 = json['price_4'];
    size = json['size'];
    depID = json['dep_ID'];
    isShow = json['is_show'];
    amount = json['amount'];
  }
}
