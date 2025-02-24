import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/core.dart';
import '../providers/search_recipe_provider.dart';
import '../widgets/app_bar_recipe_search.dart';
import '../widgets/recipe_list_tile.dart';

class SearchRecipeScreen extends ConsumerStatefulWidget {
  const SearchRecipeScreen({super.key});

  @override
  ConsumerState createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends ConsumerState<SearchRecipeScreen> {
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchRecipeState = ref.watch(searchRecipeProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Column(
      children: [
        SearchRecipeAppBar(
          controller: _editingController,
          onSearchRecipe: () {
            ref.read(searchRecipeProvider.notifier).searchRecipe(_editingController.text);
          },
        ),
        switch (searchRecipeState.status) {
          SearchRecipeStatus.success => Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: searchRecipeState.recipes.length,
                itemBuilder: (context, index) {
                  var item = searchRecipeState.recipes[index];
                  return RecipeListTile(
                    id: item.id,
                    imageUrl: item.image,
                    owner: "",
                    title: item.title,
                    likeCount: item.likes,
                    time: "",
                    ingredients: item.usedIngredients + item.missedIngredients,
                  );
                },
              ),
            ),
          SearchRecipeStatus.error => Column(
              children: [
                Image.asset(AppImages.icItemNotFound),
                Text(
                  "Recipe Not Found!",
                  style: context.appFonts.customFont(
                    fontSize: FontSize.s16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          SearchRecipeStatus.initial => const SizedBox.shrink(),
          SearchRecipeStatus.loading => const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        }
      ],
    ));
  }
}
