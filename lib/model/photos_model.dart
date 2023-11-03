class PhotosModel {
  String? id;
  String? createdAt;
  String? color;
  Map<String, dynamic>? urls;

  PhotosModel({this.id, this.color, this.createdAt, this.urls});

  PhotosModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['createdAt'];
    color = json['color'];
    urls = json['urls'];
  }

}