import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class SearchRecipeAppBar extends StatelessWidget {
  const SearchRecipeAppBar({
    super.key,
    required this.controller,
    required this.onSearchRecipe,
  });

  final TextEditingController controller;
  final Function() onSearchRecipe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              autofocus: true,
              onTap: () {
                // onTapSearch();
              },
              style: context.appFonts.customFont(
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w400,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onTapOutside: (_){
                FocusScope.of(context).unfocus();
              },
              onFieldSubmitted: (_){
                onSearchRecipe();
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kMargin12),
                  ),
                ),
                filled: true,
                fillColor: context.appColors.grayColor.withValues(alpha: 0.2),
                hintText: "Search by recipes (eg.carrots,tomatoes)",
                hintStyle: context.appFonts.customFont(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: context.appColors.grayColor.withValues(alpha: 0.5)),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              onSearchRecipe();
            },
            icon: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kMargin12),
                color: context.appColors.primaryColor,
              ),
              height: 48,
              child: Image.asset(
                AppImages.icSearch,
                color: context.appColors.whiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
