class PhotosModel{
  String? albumId;
  String? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotosModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  PhotosModel.fromJson(Map<String, dynamic> json){
    albumId = json['albumId'].toString();
    id = json['id'].toString();
    title = json['title'].toString();
    url = json['url'].toString();
    thumbnailUrl = json['thumbnailUrl'].toString();
  }
}