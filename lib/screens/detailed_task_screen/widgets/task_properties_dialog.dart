import 'package:flutter/material.dart';

class TaskPropertiesDialog extends StatelessWidget {
  const TaskPropertiesDialog({
    super.key,
    required this.items,
    required this.title,
  });

  final List<Map<String, dynamic>> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      content: SizedBox(
        height: 556,
        width: 327,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 0.8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, item);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: Container(
                      decoration: BoxDecoration(
                        color: item["color"],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item["icon"],
                        color: item["iconColor"],
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    item["label"],
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
          onPressed: () {
            print("Edit clicked");
          },
          child: const Text("Edit"),
        ),
      ],
    );
  }
}
