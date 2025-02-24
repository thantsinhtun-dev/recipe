import '../../../core/app_flavor.dart';

class ApiConst {
  static String get baseUrl => switch (AppFlavor.flavor) {
        Flavor.dev => "https://api.spoonacular.com",
        Flavor.prod => "https://api.spoonacular.com",
      };

  static String pathSearchRecipeByIngredients(String ingredients) =>
      "/recipes/findByIngredients?ingredients=$ingredients&number=15&limitLicense=true&ranking=1&ignorePantry=false";

  static String pathGetRecipeDetail(String id) => "/recipes/$id/information?includeNutrition=true";

}
