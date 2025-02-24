import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../features/recipe/domain/entities/recipe_detail_entity.dart';

class RecipeDetailConverter
    extends TypeConverter<List<RecipeDetailEntity>, String> {
  @override
  List<RecipeDetailEntity> fromSql(String fromDb) {
    List<dynamic> jsonList = json.decode(fromDb);
    return jsonList.map((e) => RecipeDetailEntity.fromJson(e)).toList();
  }

  @override
  String toSql(List<dynamic> value) {
    return json.encode(value);
  }
}
