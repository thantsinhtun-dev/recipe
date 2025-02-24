import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/features/meal_plan/domain/entities/meal_plan_entity.dart';
import 'package:recipe/features/meal_plan/domain/usecase/get_all_meal_plan_usecase.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_detail_entity.dart';
import 'package:recipe/utils/date_utils.dart';
import '../../domain/usecase/update_meal_plan_usecase.dart';

enum MealPlanStatus { initial, loading, success, error }

class MealPlanState {
  final MealPlanStatus status;
  final List<MealPlanEntity> mealPlan;
  final DateTime? currentDate;
  final String weeklyText;


  MealPlanState({
    this.status = MealPlanStatus.initial,
    this.mealPlan = const [],
    this.currentDate,
    this.weeklyText = '',
  });

  MealPlanState copyWith({
    MealPlanStatus? status,
    List<MealPlanEntity>? mealPlan,
    List<DateTime>? dates,
    int? currentWeek,
    DateTime? currentDate,
    String? weeklyText,
  }) {
    return MealPlanState(
      status: status ?? this.status,
      mealPlan: mealPlan ?? this.mealPlan,
      currentDate: currentDate ?? this.currentDate,
      weeklyText: weeklyText ?? this.weeklyText,
    );
  }
}

final mealPlanProvider = StateNotifierProvider<MealPlanProvider, MealPlanState>(
  (ref) => MealPlanProvider(
    ref.read(getAllMealPlanUseCase),
    ref.read(updateMealPlanUseCase),
  ),
);

class MealPlanProvider extends StateNotifier<MealPlanState> {
  final GetAllMealPlanUseCase _getMealPlanUseCase;
  final UpdateMealPlanUseCase _updateMealPlanUseCase;

  MealPlanProvider(
    this._getMealPlanUseCase,
    this._updateMealPlanUseCase,
  ) : super(MealPlanState());

  void initCurrentWeek() {
    state = state.copyWith(status: MealPlanStatus.loading);
    DateTime currentDate = DateTime.now();
    List<DateTime> dates = Utils.getCurrentWeek(currentDate);
    _initMealPlan(dates, currentDate);
  }

  void _initMealPlan(List<DateTime> dates, DateTime currentDate) {
    _getMealPlanUseCase.execute().listen((event) {
      List<MealPlanEntity> mealPlanList = [];
      for (var element in dates) {
        var mealPlan = event
            .where((mealPlan) => mealPlan.planDate == Utils.formatDate(element))
            .singleOrNull;
        if (mealPlan != null) {
          mealPlanList.add(mealPlan);
          continue;
        } else {
          mealPlanList.add(
            MealPlanEntity(
              planDate: Utils.formatDate(element),
              recipes: [],
              day: DateFormat('EEEE').format(element),
            ),
          );
        }
      }
      var weeklyText = "${Utils.formatDayAndMonth(dates.first)} - ${Utils.formatDayAndMonth(dates.last)}";;
      var isCurrentWeek = dates.any((e)=>Utils.formatDate(e) == Utils.formatDate(DateTime.now()));
      if(isCurrentWeek){
        weeklyText = "This Week";
      }
      state = state.copyWith(
        status: MealPlanStatus.success,
        mealPlan: mealPlanList,
        dates: dates,
        currentDate: currentDate,
        weeklyText: weeklyText,
      );
    });
  }

  void switchNextWeek() {
    DateTime currentDate = state.currentDate ?? DateTime.now();
    currentDate = currentDate.add(const Duration(days: 7));
    List<DateTime> dates = Utils.getCurrentWeek(currentDate);
    _initMealPlan(dates, currentDate);
  }

  void switchPreviousWeek() {
    DateTime currentDate = state.currentDate ?? DateTime.now();
    currentDate = currentDate.add(const Duration(days: -7));
    List<DateTime> dates = Utils.getCurrentWeek(currentDate);
    _initMealPlan(dates, currentDate);
  }

  void addToMealPlan(int index, RecipeDetailEntity entity) {
    state = state.copyWith(status: MealPlanStatus.loading);
    var mealPlanList = state.mealPlan;
    var mealPlan = mealPlanList[index];
    var recipesList = mealPlan.recipes;
    recipesList.add(entity);
    mealPlan.recipes = recipesList;
    state = state.copyWith(mealPlan: mealPlanList);
    _updateMealPlan(mealPlan);
  }

  void removeFromMealPlan(int index, RecipeDetailEntity entity) {
    var mealPlanList = state.mealPlan;
    var mealPlan = mealPlanList[index];
    var recipesList = mealPlan.recipes;
    recipesList.remove(entity);
    mealPlan.recipes = recipesList;
    state = state.copyWith(mealPlan: mealPlanList);
    _updateMealPlan(mealPlan);
  }

  Future<void> _updateMealPlan(MealPlanEntity entity) async {
    await _updateMealPlanUseCase.execute(entity);
  }
}
