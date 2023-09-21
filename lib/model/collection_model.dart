class CollectionData {
  String? status;
  String? msg;
  List<DataOfCollection>? data;

  CollectionData({this.status, this.msg, this.data});

  CollectionData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <DataOfCollection>[];
      json['data'].forEach((v) {
        data!.add(DataOfCollection.fromJson(v));
      });
    }
  }
}

class DataOfCollection {
  int? depId;
  String? depName;
  String? depPhoto;

  DataOfCollection({this.depId, this.depName, this.depPhoto});

  DataOfCollection.fromJson(Map<String, dynamic> json) {
    depId = json['dep_id'];
    depName = json['dep_name'];
    depPhoto = json['dep_photo'];
  }
}
