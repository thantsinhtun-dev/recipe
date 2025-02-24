import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import '../features/auth/ui/screens/login_screen.dart';
import '../features/recipe/ui/screens/favourite_screen.dart';
import '../features/recipe/ui/screens/home_screen.dart';
import '../features/main/screens/meal_plan_screen.dart';
import '../features/main/screens/settings_screen.dart';
import '../features/main/screens/skeleton_screen.dart';
import '../features/recipe/ui/screens/recipe_detail_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: SkeletonRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, path: 'home'),
            AutoRoute(page: MealPlanRoute.page, path: 'mealPlan'),
            AutoRoute(page: FavouriteRoute.page, path: 'favourite'),
            AutoRoute(page: SettingsRoute.page, path: 'settings'),
          ],
        ),
        AutoRoute(page: RecipeDetailRoute.page, path: '/recipeDetail'),
      ];
}
