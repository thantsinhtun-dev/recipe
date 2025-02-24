abstract class BaseResponseModel<T> {
  T fromJsonList(List<dynamic> list);
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
