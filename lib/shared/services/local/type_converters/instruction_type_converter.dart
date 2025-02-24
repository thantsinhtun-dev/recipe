import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../features/recipe/domain/entities/recipe_detail_entity.dart';

class InstructionTypeConverter
    extends TypeConverter<List<AnalyzedInstructionEntity>, String> {
  @override
  List<AnalyzedInstructionEntity> fromSql(String fromDb) {
    List<dynamic> jsonList = json.decode(fromDb);
    return jsonList.map((e) => AnalyzedInstructionEntity.fromJson(e)).toList();
  }

  @override
  String toSql(List<dynamic> value) {
    return json.encode(value);
  }
}
