import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list_app/data/services/categories_service.dart';
import 'package:todo_list_app/domain/services/domain_categories_services.dart';

import '../../../domain/models/category_model/category.dart';

Future showCategoryDialog(
  BuildContext context,
) async {
  final selected = await showDialog<Category>(
    context: context,
    builder: (context) => const CategoryDialog(),
  );
  return selected;
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
      title: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            "Task Categories",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      content: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 500,
              width: 327,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 0.8),
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = categoryList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context, item);
                      log("pressed ${item.label}");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: Material(
                            color: item.color,
                            borderRadius: BorderRadius.circular(10),
                            child: Icon(item.icon,
                                color: item.iconColor, size: 30),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          item.label,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
