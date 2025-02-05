import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list_app/domain/models/category_model/category.dart';
import 'package:todo_list_app/domain/services/domain_categories_services.dart';

class CategoriesServiceImpl implements CategoriesService {
  @override
  Future<List<Category>> getCategories() async {
    try {
      return [
        Category(
          id: 1,
          icon: Icons.local_grocery_store_outlined,
          iconColor: Color(0xFF21A300),
          label: "Grocery",
          color: Color(0xFFCCFF80),
        ),
        Category(
          id: 2,
          icon: Icons.work_outline_outlined,
          iconColor: Color(0xFFA31D00),
          label: "Work",
          color: Color(0xFFFF9680),
        ),
        Category(
          id: 3,
          icon: Icons.sports_outlined,
          iconColor: Color(0xFF00A32F),
          label: "Sport",
          color: Color(0xFF80FFFF),
        ),
        Category(
          id: 4,
          icon: Icons.design_services_outlined,
          iconColor: Color(0xFF00A372),
          label: "Design",
          color: Color(0xFF80FFD9),
        ),
        Category(
          id: 5,
          icon: Icons.school_outlined,
          iconColor: Color(0xFF0055A3),
          label: "University",
          color: Color(0xFF809CFF),
        ),
        Category(
          id: 6,
          icon: Icons.people_outline,
          iconColor: Color(0xFFA30089),
          label: "Social",
          color: Color(0xFFFF80EB),
        ),
        Category(
          id: 7,
          icon: Icons.music_note_outlined,
          iconColor: Color(0xFFA000A3),
          label: "Music",
          color: Color(0xFFFC80FF),
        ),
        Category(
          id: 8,
          icon: Icons.health_and_safety_outlined,
          iconColor: Color(0xFF00A3A3),
          label: "Health",
          color: Color(0xFF80FFA3),
        ),
        Category(
          id: 9,
          icon: Icons.video_camera_back_outlined,
          iconColor: Color(0xFF0069A3),
          label: "Movie",
          color: Color(0xFF80D1FF),
        ),
        Category(
          id: 10,
          icon: Icons.home_outlined,
          iconColor: Color(0xFFA30000),
          label: "Home",
          color: Color(0xFFFF8080),
        ),
      ];
    } catch (e, s) {
      log("Error with method getCategories() [CategoriesServiceImpl] $e $s");
      throw UnimplementedError();
    }
  }
}
