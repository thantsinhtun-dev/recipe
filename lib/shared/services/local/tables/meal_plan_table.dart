import 'package:drift/drift.dart';
import 'package:recipe/features/meal_plan/domain/entities/meal_plan_entity.dart';
import '../../../../features/recipe/domain/entities/recipe_detail_entity.dart';
import '../type_converters/ingredient_type_converter.dart';
import '../type_converters/instruction_type_converter.dart';
import '../type_converters/nutrition_type_converter.dart';
import '../type_converters/recipe_detail_converter.dart';

@UseRowClass(MealPlanEntity, generateInsertable: true)
class MealPlanTable extends Table {
  TextColumn get planDate => text()();

  TextColumn get day => text()();

  TextColumn get recipes => text().map(RecipeDetailConverter())();

  @override
  Set<Column<Object>>? get primaryKey => {planDate};

  @override
  String? get tableName => "meal_plan_table";
}
