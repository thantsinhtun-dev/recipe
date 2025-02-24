import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/meal_plan/domain/usecase/get_all_recipe_usecase.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';

class RecipeSheetState {
  List<RecipeDetailEntity> entities;

  RecipeSheetState({
    this.entities = const [],
  });

  RecipeSheetState copyWith({
    List<RecipeDetailEntity>? entities,
  }) {
    return RecipeSheetState(
      entities: entities ?? this.entities,
    );
  }
}

final recipeSheetProvider = StateNotifierProvider<RecipeSheetProvider, RecipeSheetState>(
  (ref) => RecipeSheetProvider(
    ref.read(getAllRecipeListUseCase),
  ),
);

class RecipeSheetProvider extends StateNotifier<RecipeSheetState> {
  final GetAllRecipeListUseCase _getAllRecipeListUseCase;

  RecipeSheetProvider(
    this._getAllRecipeListUseCase,
  ) : super(RecipeSheetState());

  void loadAllRecipes() {
    _getAllRecipeListUseCase.execute().listen((event) {
      state = state.copyWith(entities: event);
    });
  }
}
