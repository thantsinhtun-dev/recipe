import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/features/recipe/domain/entities/search_ingredient_entity.dart';
import 'package:recipe/features/recipe/domain/usecases/get_recipe_by_meal_type_usecase.dart';

import '../../../../core/app_strings.dart';

enum HomeProviderStatus { initial, loading, success, error }

class HomeProviderState {
  final HomeProviderStatus status;
  final List<RecipeDetailEntity> recipes;
  final String currentMealType;
  final List<String> mealTypes;

  HomeProviderState({
    this.status = HomeProviderStatus.initial,
    this.recipes = const [],
    this.currentMealType = "",
    this.mealTypes = const [],
  });

  HomeProviderState copyWith({
    HomeProviderStatus? status,
    List<RecipeDetailEntity>? recipes,
    String? currentMealType,
    List<String>? mealTypes,
  }) {
    return HomeProviderState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
      currentMealType: currentMealType ?? this.currentMealType,
      mealTypes: mealTypes ?? this.mealTypes,
    );
  }
}

final homeProvider = StateNotifierProvider<HomeProvider, HomeProviderState>(
  (ref) => HomeProvider(
    ref.read(getRecipeByMealTypeUseCase),
  ),
);

class HomeProvider extends StateNotifier<HomeProviderState> {
  final GetRecipeByMealTypeUseCase _getRecipeByMealTypeUseCase;

  HomeProvider(
    this._getRecipeByMealTypeUseCase,
  ) : super(HomeProviderState());

  Future<void> initHomeRecipe() async {
    var mealTypes = AppStrings.mealTypes;

    state = state.copyWith(
      status: HomeProviderStatus.loading,
      currentMealType: mealTypes.first,
    );
    try {
      var result = await _getRecipeByMealTypeUseCase.execute(mealTypes.first.toLowerCase());
      state = state.copyWith(
        status: HomeProviderStatus.success,
        recipes: result,
        currentMealType: mealTypes.first,
        mealTypes: mealTypes,
      );
    } on Exception catch (e) {
      state = state.copyWith(status: HomeProviderStatus.error);
    } catch (e) {
      state = state.copyWith(status: HomeProviderStatus.error);
    }
  }

  Future<void> changeMealType(String mealType) async {
    state = state.copyWith(status: HomeProviderStatus.loading, currentMealType: mealType);
    try {
      var result = await _getRecipeByMealTypeUseCase.execute(mealType.toLowerCase());
      state = state.copyWith(
        status: HomeProviderStatus.success,
        currentMealType: mealType,
        recipes: result,
      );
    } on Exception catch (e) {
      state = state.copyWith(status: HomeProviderStatus.error);
    } catch (e) {
      state = state.copyWith(status: HomeProviderStatus.error);
    }
  }
}
