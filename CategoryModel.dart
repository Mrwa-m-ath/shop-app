class CategoriesModel {
  var status;

  CatogrageData? data;

  // CategoriesModel({this.status, this.message, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    // message = json['message'];
    data = CatogrageData.fromJson(json['data']);
  }
}

class CatogrageData {
  var currentPage;
  List<DataData>? data;

  CatogrageData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    data = <DataData>[];
    json['data'].forEach((v) {
      data!.add(new DataData.fromJson(v));
    });
  }
}

class DataData {
  var id;
  var name;
  var image;

  DataData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
