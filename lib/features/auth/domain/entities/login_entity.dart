import 'dart:convert';

class LoginEntity {
  final String id;
  final String userNickname;
  final String avatar;
  final String avatarThumb;
  final String sex;
  final String signature;
  final String coin;
  final String consumption;
  final String votesTotal;
  final String province;
  final String city;
  final String birthday;
  final String loginType;
  final String lastLoginTime;
  final String location;
  final String isReg;
  final String level;
  final String levelAnchor;
  final String token;

  LoginEntity({
    required this.id,
    required this.userNickname,
    required this.avatar,
    required this.avatarThumb,
    required this.sex,
    required this.signature,
    required this.coin,
    required this.consumption,
    required this.votesTotal,
    required this.province,
    required this.city,
    required this.birthday,
    required this.loginType,
    required this.lastLoginTime,
    required this.location,
    required this.isReg,
    required this.level,
    required this.levelAnchor,
    required this.token,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
        id: json["id"],
        userNickname: json["user_nickname"],
        avatar: json["avatar"],
        avatarThumb: json["avatar_thumb"],
        sex: json["sex"],
        signature: json["signature"],
        coin: json["coin"],
        consumption: json["consumption"],
        votesTotal: json["votes_total"],
        province: json["province"],
        city: json["city"],
        birthday: json["birthday"],
        loginType: json["login_type"],
        lastLoginTime: json["last_login_time"],
        location: json["location"],
        isReg: json["is_reg"],
        level: json["level"],
        levelAnchor: json["level_anchor"],
        token: json["token"],
      );

  factory LoginEntity.fromEncodeJson(String obj) => LoginEntity.fromJson(json.decode(obj));
  String toEncodeJson() => json.encode(
        {
          "id": id,
          "user_nickname": userNickname,
          "avatar": avatar,
          "avatar_thumb": avatarThumb,
          "sex": sex,
          "signature": signature,
          "coin": coin,
          "consumption": consumption,
          "votes_total": votesTotal,
          "province": province,
          "city": city,
          "birthday": birthday,
          "login_type": loginType,
          "last_login_time": lastLoginTime,
          "location": location,
          "is_reg": isReg,
          "level": level,
          "level_anchor": levelAnchor,
          "token": token,
        },
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
    "votes_total": votesTotal,
    "province": province,
    "city": city,
    "birthday": birthday,
    "login_type": loginType,
    "last_login_time": lastLoginTime,
    "location": location,
    "is_reg": isReg,
    "level": level,
    "level_anchor": levelAnchor,
    "token": token,
  };
}
