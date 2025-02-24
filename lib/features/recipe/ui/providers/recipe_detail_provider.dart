import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/features/recipe/domain/usecases/toggle_favourite_recipe_usecase.dart';
import 'package:recipe/shared/services/remote/dio/error_handler.dart';

import '../../domain/usecases/get_recipe_detail_usecase.dart';

enum RecipeDetailStatus { initial, loading, success, error }

class RecipeDetailState {
  final RecipeDetailStatus status;
  final RecipeDetailEntity? entity;
  final String msg;

  RecipeDetailState({
    this.status = RecipeDetailStatus.initial,
    this.entity,
    this.msg = "",
  });

  RecipeDetailState copyWith({
    RecipeDetailStatus? status,
    RecipeDetailEntity? entity,
    String? msg,
  }) {
    return RecipeDetailState(
      status: status ?? this.status,
      entity: entity ?? this.entity,
      msg: msg ?? this.msg,
    );
  }
}

final recipeDetailProvider =
    StateNotifierProvider<RecipeDetailProvider, RecipeDetailState>(
  (ref) => RecipeDetailProvider(
    ref.read(getRecipeDetailUseCase),
    ref.read(toggleFavouriteRecipeUseCase),
  ),
);

class RecipeDetailProvider extends StateNotifier<RecipeDetailState> {
  final GetRecipeDetailUseCase _getRecipeDetailUseCase;
  final ToggleFavouriteRecipeUseCase _toggleFavouriteRecipeUseCase;

  RecipeDetailProvider(
    this._getRecipeDetailUseCase,
    this._toggleFavouriteRecipeUseCase,
  ) : super(RecipeDetailState());

  Future<void> getRecipeDetail(String id) async {
    state = state.copyWith(status: RecipeDetailStatus.loading);
    // try {
      var result = await _getRecipeDetailUseCase.execute(id);
      state = state.copyWith(status: RecipeDetailStatus.success, entity: result);
    // } on ErrorHandler catch (e) {
    //   state = state.copyWith(status: RecipeDetailStatus.error, msg: e.getErrorMessage());
    // } catch (e) {
    //   state = state.copyWith(status: RecipeDetailStatus.error, msg: e.toString());
    // }
  }

  Future<void> toggleFavorite() async {
    var entity = state.entity;
    if (entity == null) return;
    entity.isFavourite = !entity.isFavourite;
    state = state.copyWith(entity: entity);
    await _toggleFavouriteRecipeUseCase.execute(entity);
  }
}
