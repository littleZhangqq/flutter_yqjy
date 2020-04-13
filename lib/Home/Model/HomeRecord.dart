class HomeRecord {
  List<Banners> banners;
  List<News> news;
  String avatar;
  int oilFee;
  int lastTimeFee;
  int islogin;
  String countEarn;
  String taskEarn;
  int stationId;
  String stationDesc;
  List<Invites> invites;

  HomeRecord(
      {this.banners,
      this.news,
      this.avatar,
      this.oilFee,
      this.lastTimeFee,
      this.islogin,
      this.countEarn,
      this.taskEarn,
      this.stationId,
      this.stationDesc,
      this.invites});

  HomeRecord.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    if (json['news'] != null) {
      news = new List<News>();
      json['news'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
    avatar = json['avatar'];
    oilFee = json['oil_fee'];
    lastTimeFee = json['last_time_fee'];
    islogin = json['islogin'];
    countEarn = json['count_earn'];
    taskEarn = json['task_earn'];
    stationId = json['station_id'];
    stationDesc = json['station_desc'];
    if (json['invites'] != null) {
      invites = new List<Invites>();
      json['invites'].forEach((v) {
        invites.add(new Invites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    data['avatar'] = this.avatar;
    data['oil_fee'] = this.oilFee;
    data['last_time_fee'] = this.lastTimeFee;
    data['islogin'] = this.islogin;
    data['count_earn'] = this.countEarn;
    data['task_earn'] = this.taskEarn;
    data['station_id'] = this.stationId;
    data['station_desc'] = this.stationDesc;
    if (this.invites != null) {
      data['invites'] = this.invites.map((v) => v.toJson()).toList();
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

class News {
  String newsLink;
  int id;
  String newsTitle;
  String newsPath;
  String params;
  String urlType;

  News(
      {this.newsLink,
      this.id,
      this.newsTitle,
      this.newsPath,
      this.params,
      this.urlType});

  News.fromJson(Map<String, dynamic> json) {
    newsLink = json['news_link'];
    id = json['id'];
    newsTitle = json['news_title'];
    newsPath = json['news_path'];
    params = json['params'];
    urlType = json['url_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_link'] = this.newsLink;
    data['id'] = this.id;
    data['news_title'] = this.newsTitle;
    data['news_path'] = this.newsPath;
    data['params'] = this.params;
    data['url_type'] = this.urlType;
    return data;
  }
}

class Invites {
  int status;
  int sum;
  int current;
  int id;
  String title;
  String thumb;
  int total;
  int getNum;
  String desc;
  String tags;

  Invites(
      {this.status,
      this.sum,
      this.current,
      this.id,
      this.title,
      this.thumb,
      this.total,
      this.getNum,
      this.desc,
      this.tags});

  Invites.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sum = json['sum'];
    current = json['current'];
    id = json['id'];
    title = json['title'];
    thumb = json['thumb'];
    total = json['total'];
    getNum = json['get_num'];
    desc = json['desc'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['sum'] = this.sum;
    data['current'] = this.current;
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumb'] = this.thumb;
    data['total'] = this.total;
    data['get_num'] = this.getNum;
    data['desc'] = this.desc;
    data['tags'] = this.tags;
    return data;
  }
}