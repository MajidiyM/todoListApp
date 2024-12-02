import 'package:flutter/material.dart';

import '../models/models.dart';

final List<Priority> priorities = List.generate(
  10,
  (index) => Priority(
    icon: Icons.flag,
    iconColor: Colors.blueAccent,
    label: (index + 1).toString(),
    color: Colors.grey[800]!,
  ),
);
