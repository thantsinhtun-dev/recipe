import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:recipe/shared/services/local/tables/meal_plan_table.dart';
import 'package:recipe/shared/services/local/tables/recipe_table.dart';
import 'package:recipe/shared/services/local/type_converters/ingredient_type_converter.dart';
import 'package:recipe/shared/services/local/type_converters/instruction_type_converter.dart';
import 'package:recipe/shared/services/local/type_converters/nutrition_type_converter.dart';

import '../../../features/meal_plan/domain/entities/meal_plan_entity.dart';
import '../../../features/recipe/domain/entities/recipe_detail_entity.dart';
import 'dao/meal_plan_dao.dart';
import 'dao/recipe_dao.dart';
import 'type_converters/recipe_detail_converter.dart';

part 'app_database.g.dart';

final databaseProvider = Provider((ref){
  return AppDatabase();
});
@DriftDatabase(
  tables: [
    RecipeTable,
    MealPlanTable
  ],
  daos: [
    RecipeDao,
    MealPlanDao,
  ]
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> deleteEverything() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      transaction(() async {
        for (final table in allTables) {
          await delete(table).go();
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'recipe.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}