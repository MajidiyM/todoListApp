import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list_app/data/services/categories_service.dart';
import 'package:todo_list_app/domain/services/domain_categories_services.dart';

import '../../../domain/models/category_model/category.dart';

Future<void> showCategoryDialog(
  BuildContext context,
) async {
  await showDialog(
    context: context,
    builder: (context) => const CategoryDialog(),
  );
}

class CategoryDialog extends StatefulWidget {
  const CategoryDialog({super.key});

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  List<Category> categoryList = [];
  late final CategoriesService categoriesService;

  Future<void> initCategories() async {
    try {
      final response = await categoriesService.getCategories();

      setState(() {
        categoryList.addAll(response);
      });
    } catch (e, s) {
      log("$e $s");
    }
  }

  @override
  void initState() {
    categoriesService = CategoriesServiceImpl();
    initCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 500,
              width: 500,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = categoryList[index];
                  return Text(item.label);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
