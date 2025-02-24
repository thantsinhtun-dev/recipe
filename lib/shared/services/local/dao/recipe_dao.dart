import 'package:drift/drift.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';

import '../app_database.dart';
import '../tables/recipe_table.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(tables: [RecipeTable])
class RecipeDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase _db;

  RecipeDao(this._db) : super(_db);

  Future<void> insertAll(List<RecipeDetailEntity> routes) async {
    await batch((batch) => batch.insertAllOnConflictUpdate(_db.recipeTable, routes));
  }

  Future<void> insert(RecipeDetailEntity entity) async {
    await into(_db.recipeTable).insertOnConflictUpdate(entity);
  }

  Future<RecipeDetailEntity?> get(String id) {
    return (select(_db.recipeTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<List<RecipeDetailEntity>> getAllData() {
    return select(_db.recipeTable).watch();
  }

  Future<int> deleteAll() {
    return _db.recipeTable.deleteAll();
  }

  Stream<List<RecipeDetailEntity>> getFavouriteRecipes() {
    return (select(_db.recipeTable)..where((tbl) => tbl.isFavourite.equals(true))).watch();
  }
}
