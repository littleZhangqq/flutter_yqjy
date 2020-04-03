
class BaseRecord<T> {
  int code;
  String msg;
  T data;

  BaseRecord({this.code, this.msg, this.data});

  BaseRecord.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}

class UserRecord {
  int id;
  String userTel;
  String userNickname;
  String openid;
  String platform;
  String avatar;
  String loginTime;
  String createTime;
  int isOwner;
  int isMerchant;

  UserRecord(
      {this.id,
      this.userTel,
      this.userNickname,
      this.openid,
      this.platform,
      this.avatar,
      this.loginTime,
      this.createTime,
      this.isOwner,
      this.isMerchant});

  UserRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userTel = json['user_tel'];
    userNickname = json['user_nickname'];
    openid = json['openid'];
    platform = json['platform'];
    avatar = json['avatar'];
    loginTime = json['login_time'];
    createTime = json['create_time'];
    isOwner = json['is_owner'];
    isMerchant = json['is_merchant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_tel'] = this.userTel;
    data['user_nickname'] = this.userNickname;
    data['openid'] = this.openid;
    data['platform'] = this.platform;
    data['avatar'] = this.avatar;
    data['login_time'] = this.loginTime;
    data['create_time'] = this.createTime;
    data['is_owner'] = this.isOwner;
    data['is_merchant'] = this.isMerchant;
    return data;
  }
}