import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/core/app_fonts.dart';
import 'package:recipe/features/recipe/ui/providers/favourite_provider.dart';

import '../widgets/recipe_list_tile.dart';

@RoutePage()
class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favouriteProvider.notifier).getFavouriteRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    var favouriteState = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite",
          style: context.appFonts.customFont(
            fontSize: FontSize.s18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: favouriteState.recipes.length,
        itemBuilder: (context, index) {
          var item = favouriteState.recipes[index];
          return RecipeListTile(
            id: item.id,
            imageUrl: item.image,
            owner: "",
            title: item.title,
            likeCount: item.aggregateLikes,
            time: "",
            ingredients: item.extendedIngredients.map((e) => e.name).toList(),
          );
        },
      ),
    );
  }
}
