class SearchRecipeEntity {
  final String id;
  final String title;
  final String image;
  final int usedIngredientCount;
  final int missedIngredientCount;
  final List<String> missedIngredients;
  final List<String> usedIngredients;
  final int likes;

  SearchRecipeEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.usedIngredientCount,
    required this.missedIngredientCount,
    required this.missedIngredients,
    required this.usedIngredients,
    required this.likes,
  });
}
