import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../data/services/priorities_services.dart';
import '../../../domain/models/priorities_model/priority.dart';
import '../../../domain/services/domain_priorities_services.dart';

Future showPriorityDialog(BuildContext context) async {
  final selected = await showDialog<Priority>(
    context: context,
    builder: (context) => const PriorityDialog(),
  );
  return selected;
}

class PriorityDialog extends StatefulWidget {
  const PriorityDialog({super.key});

  @override
  State<PriorityDialog> createState() => _PriorityDialogState();
}

class _PriorityDialogState extends State<PriorityDialog> {
  List<Priority> priorityList = [];
  late final PrioritiesServices prioritiesServices;

  Future<void> initPriorities() async {
    try {
      final response = await prioritiesServices.getPriorirties();

      setState(() {
        priorityList.addAll(response);
      });
    } catch (e, s) {
      log("$e $s");
    }
  }

  @override
  void initState() {
    prioritiesServices = PrioritiesServiceImpl();
    initPriorities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            "Task Priority",
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
                  childAspectRatio: 0.8,
                ),
                itemCount: priorityList.length,
                itemBuilder: (BuildContext contex, int index) {
                  final item = priorityList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(contex, item);
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
                            child: Icon(
                              item.icon,
                              color: item.iconColor,
                              size: 30,
                            ),
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
