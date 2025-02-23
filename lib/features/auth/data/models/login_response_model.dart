import '../../../../shared/domain/models/base_response_model.dart';
import '../../domain/entities/entities.dart';

class LoginResponseModel extends BaseResponseModel {
  int? ret;
  LoginDataModel? data;
  String? msg;

  LoginResponseModel({
    this.ret,
    this.data,
    this.msg,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      ret: json["ret"],
      data: json["data"] == null ? null : LoginDataModel.fromJson(json["data"]),
      msg: json["msg"],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "ret": ret,
      "data": data?.toJson(),
      "msg": msg,
    };
  }
}

class LoginDataModel {
  int? code;
  String? msg;
  List<LoginInfoModel>? info;

  LoginDataModel({
    this.code,
    this.msg,
    this.info,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        code: json["code"],
        msg: json["msg"],
        info: json["info"] == null
            ? []
            : List<LoginInfoModel>.from(
                json["info"]!.map((x) => LoginInfoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "info": info == null ? [] : List<dynamic>.from(info!.map((x) => x.toJson())),
      };
}

class LoginInfoModel {
  String? id;
  String? userNickname;
  String? avatar;
  String? avatarThumb;
  String? sex;
  String? signature;
  String? coin;
  String? consumption;
  String? votestotal;
  String? province;
  String? city;
  String? birthday;
  String? loginType;
  String? lastLoginTime;
  String? location;
  String? isreg;
  String? level;
  String? levelAnchor;
  String? token;

  LoginInfoModel({
    this.id,
    this.userNickname,
    this.avatar,
    this.avatarThumb,
    this.sex,
    this.signature,
    this.coin,
    this.consumption,
    this.votestotal,
    this.province,
    this.city,
    this.birthday,
    this.loginType,
    this.lastLoginTime,
    this.location,
    this.isreg,
    this.level,
    this.levelAnchor,
    this.token,
  });

  factory LoginInfoModel.fromJson(Map<String, dynamic> json) => LoginInfoModel(
        id: json["id"],
        userNickname: json["user_nickname"],
        avatar: json["avatar"],
        avatarThumb: json["avatar_thumb"],
        sex: json["sex"],
        signature: json["signature"],
        coin: json["coin"].toString(),
        consumption: json["consumption"],
        votestotal: json["votestotal"],
        province: json["province"],
        city: json["city"],
        birthday: json["birthday"],
        loginType: json["login_type"],
        lastLoginTime: json["last_login_time"],
        location: json["location"],
        isreg: json["isreg"],
        level: json["level"],
        levelAnchor: json["level_anchor"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_nickname": userNickname,
        "avatar": avatar,
        "avatar_thumb": avatarThumb,
        "sex": sex,
        "signature": signature,
        "coin": coin,
        "consumption": consumption,
        "votestotal": votestotal,
        "province": province,
        "city": city,
        "birthday": birthday,
        "login_type": loginType,
        "last_login_time": lastLoginTime,
        "location": location,
        "isreg": isreg,
        "level": level,
        "level_anchor": levelAnchor,
        "token": token,
      };

  LoginEntity toEntity() {
    return LoginEntity(
      id: id ?? "",
      userNickname: userNickname ?? "",
      avatar: avatar ?? "",
      avatarThumb: avatarThumb ?? "",
      sex: sex ?? "",
      signature: signature ?? "",
      coin: coin ?? "",
      consumption: consumption ?? "",
      votesTotal: votestotal ?? "",
      province: province ?? "",
      city: city ?? "",
      birthday: birthday ?? "",
      loginType: loginType ?? "",
      lastLoginTime: lastLoginTime ?? "",
      location: location ?? "",
      isReg: isreg ?? "",
      level: level ?? "",
      levelAnchor: levelAnchor ?? "",
      token: token ?? "",
    );
  }
}
