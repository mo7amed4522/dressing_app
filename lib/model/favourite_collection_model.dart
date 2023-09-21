class FavouriteCollection {
  String? status;
  String? msg;
  List<FavouritData>? data;

  FavouriteCollection({this.status, this.msg, this.data});

  FavouriteCollection.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <FavouritData>[];
      json['data'].forEach((v) {
        data!.add(FavouritData.fromJson(v));
      });
    }
  }
}

class FavouritData {
  int? colId;
  String? collectionName;
  String? photo;
  int? rate;

  FavouritData({this.colId, this.collectionName, this.photo, this.rate});

  FavouritData.fromJson(Map<String, dynamic> json) {
    colId = json['col_id'];
    collectionName = json['collection_name'];
    photo = json['photo'];
    rate = json['rate'];
  }
}
