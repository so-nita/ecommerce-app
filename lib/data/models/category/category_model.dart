class CategoryModel {
  int? id;
  String? name;
  String? image;
  String? imageUrl; // New field to store the image URL

  CategoryModel({this.id, this.name, this.image, this.imageUrl});

  // Update the fromJson method to include image_url
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    imageUrl = json['image_url']; // Fetch image URL from JSON
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
