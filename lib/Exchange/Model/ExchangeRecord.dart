class ExchangeRecord {
  List<String> tags;
  int coin;
  List<Banners> banners;
  List<Products> products;

  ExchangeRecord({this.tags, this.coin, this.banners, this.products});

  ExchangeRecord.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    coin = json['coin'];
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags'] = this.tags;
    data['coin'] = this.coin;
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  String path;
  int id;
  String link;
  String params;
  String desc;
  String urlType;

  Banners(
      {this.path, this.id, this.link, this.params, this.desc, this.urlType});

  Banners.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    id = json['id'];
    link = json['link'];
    params = json['params'];
    desc = json['desc'];
    urlType = json['url_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['id'] = this.id;
    data['link'] = this.link;
    data['params'] = this.params;
    data['desc'] = this.desc;
    data['url_type'] = this.urlType;
    return data;
  }
}

class Products {
  int id;
  String tags;
  String thumb;
  String name;
  int coin;

  Products({this.id, this.tags, this.thumb, this.name, this.coin});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tags = json['tags'];
    thumb = json['thumb'];
    name = json['name'];
    coin = json['coin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tags'] = this.tags;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['coin'] = this.coin;
    return data;
  }
}