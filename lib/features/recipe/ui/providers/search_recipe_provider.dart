import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/usecases/search_recipe_by_ingredient_usecase.dart';
import 'package:recipe/shared/services/remote/dio/error_handler.dart';

import '../../domain/entities/search_ingredient_entity.dart';

enum SearchRecipeStatus { initial, loading, success, error }

class SearchRecipeState {
  final SearchRecipeStatus status;
  final List<SearchRecipeEntity> recipes;

  SearchRecipeState({
    this.status = SearchRecipeStatus.initial,
    this.recipes = const [],
  });

  SearchRecipeState copyWith({
    SearchRecipeStatus? status,
    List<SearchRecipeEntity>? recipes,
  }) {
    return SearchRecipeState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
    );
  }
}

final searchRecipeProvider =
    StateNotifierProvider.autoDispose<SearchRecipeProvider, SearchRecipeState>(
  (ref) => SearchRecipeProvider(
    ref.read(searchRecipeByIngredientUseCaseProvider),
  ),
);

class SearchRecipeProvider extends StateNotifier<SearchRecipeState> {
  final SearchRecipeByIngredientUseCase _recipeByIngredientUseCase;

  SearchRecipeProvider(
    this._recipeByIngredientUseCase,
  ) : super(SearchRecipeState());

  Future<void> searchRecipe(String ingredients) async {
    state = state.copyWith(status: SearchRecipeStatus.loading);
    try {
      final recipes = await _recipeByIngredientUseCase.execute(ingredients);
      if(recipes.isNotEmpty) {
        state = state.copyWith(status: SearchRecipeStatus.success, recipes: recipes);
      }else {
        state = state.copyWith(status: SearchRecipeStatus.error);
      }
    } on ErrorHandler catch (e) {
      state = state.copyWith(status: SearchRecipeStatus.error);
    } catch (e) {
      state = state.copyWith(status: SearchRecipeStatus.error);
    }
  }
}
