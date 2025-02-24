import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../features/recipe/domain/entities/recipe_detail_entity.dart';

class IngredientTypeConverter
    extends TypeConverter<List<ExtendedIngredientEntity>, String> {
  @override
  List<ExtendedIngredientEntity> fromSql(String fromDb) {
    List<dynamic> jsonList = json.decode(fromDb);
    return jsonList.map((e) => ExtendedIngredientEntity.fromJson(e)).toList();
  }

  @override
  String toSql(List<dynamic> value) {
    return json.encode(value);
  }
}
