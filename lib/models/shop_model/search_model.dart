class SearchModel
{
  bool? status;
  String? message;
  DataItem? data;

  SearchModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataItem.fromJson(json['data']) : null;
  }
}

class DataItem
{
  int? currentPage;
  List<Product>? data;
  String? image;
  int? from;
  int? lastPage;
  String? firstPageUrl;
  String? lastPageUrl;
  int? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  DataItem.fromJson(Map<String, dynamic> json)
  {
    currentPage = json['current_page'];
    if(json['data'] != null)
    {
      data = [] ;
      json['data'].forEach((element)
      {
        data!.add(Product.fromJson(element));
      });
    }


    image = json['image'];
    from = json['from'];
    firstPageUrl = json['first_page_url'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

}

class Product
{
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;

  Product.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}