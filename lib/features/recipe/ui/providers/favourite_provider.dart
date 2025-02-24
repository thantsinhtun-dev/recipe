import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/usecases/get_favourite_recipe_usecase.dart';
import 'package:recipe/shared/services/remote/dio/error_handler.dart';

import '../../domain/entities/recipe_detail_entity.dart';

enum FavouriteStatus { initial, loading, success, error }

class FavouriteState {
  final FavouriteStatus status;
  final List<RecipeDetailEntity> recipes;

  FavouriteState({
    this.status = FavouriteStatus.initial,
    this.recipes = const [],
  });

  FavouriteState copyWith({
    FavouriteStatus? status,
    List<RecipeDetailEntity>? recipes,
  }) {
    return FavouriteState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
    );
  }
}

final favouriteProvider = StateNotifierProvider<FavouriteProvider, FavouriteState>(
  (ref) => FavouriteProvider(
    ref.read(getFavouriteRecipeUseCase),
  ),
);

class FavouriteProvider extends StateNotifier<FavouriteState> {
  final GetFavouriteRecipeUseCase _favouriteRecipeUseCase;

  FavouriteProvider(this._favouriteRecipeUseCase) : super(FavouriteState());

  Future<void> getFavouriteRecipes() async {
    state = state.copyWith(status: FavouriteStatus.loading);
    try {
      _favouriteRecipeUseCase.execute().listen((data) {
        state = state.copyWith(status: FavouriteStatus.success, recipes: data);
      });
    } on ErrorHandler catch (e) {
      state = state.copyWith(status: FavouriteStatus.error);
    } catch (e) {
      state = state.copyWith(status: FavouriteStatus.error);
    }
  }
}
