class ProductModel {
  int? id;
  int? categoryId;
  int? brandId;
  String? name;
  String? description;
  int? isTrendy;
  int? isAvaiable;
  int? price;
  int? amount;
  Null? discount;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  ProductModel(
      {this.id,
      this.categoryId,
      this.brandId,
      this.name,
      this.description,
      this.isTrendy,
      this.isAvaiable,
      this.price,
      this.amount,
      this.discount,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    name = json['name'];
    description = json['description'];
    isTrendy = json['is_trendy'];
    isAvaiable = json['is_avaiable'];
    price = json['price'];
    amount = json['amount'];
    discount = json['discount'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['is_trendy'] = this.isTrendy;
    data['is_avaiable'] = this.isAvaiable;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
