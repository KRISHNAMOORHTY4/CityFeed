class PostTapbarModel {
 final String name;
 final String description;
 final String imageurl;
 final DateTime createdAt;

 PostTapbarModel({required this.name, required this.description, required this.imageurl, required this.createdAt}); 

 factory PostTapbarModel.fromJson(Map<String,dynamic>json){
final  String nameData=json['brand'] ?? '';
final String descriptionData=json['description']?? '';
final String imageData=json['thumbnail']?? '';
final getDate=json['meta']['createdAt'];
final DateTime createdAtData=DateTime.tryParse(getDate.toString()) ?? DateTime.now();
  return PostTapbarModel(name: nameData, description: descriptionData, imageurl: imageData, createdAt: createdAtData);
 }
}