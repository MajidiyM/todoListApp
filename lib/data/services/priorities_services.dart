import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_list_app/domain/models/priorities_model/priority.dart';
import 'package:todo_list_app/domain/services/domain_priorities_services.dart';

class PrioritiesServiceImpl implements PrioritiesServices {
  @override
  Future<List<Priority>> getPriorirties() async {
    try {
      return List.generate(
        10,
        (index) => Priority(
          iconColor: Colors.blueAccent,
          icon: Icons.flag,
          label: (index + 1).toString(),
          color: Colors.grey[800]!,
        ),
      );
    } catch (e, s) {
      log("Error with method getPriorirties() [PrioritiesServiceImpl] $e $s");
      throw UnimplementedError();
    }
  }
}
