import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "package:syncfusion_flutter_datepicker/datepicker.dart";

class Utils {
  Future<void> showDateRangePicker(
    BuildContext context, {
    required Function(DateTime? startDate, DateTime? endDate) onDateSelected,
  }) async {
    DateTime? _startDate;
    DateTime? _endDate;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF2f2d38),
        title: Text("Select Start and End Dates"),
        content: SizedBox(
          height: 300,
          width: 350,
          child: SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                _startDate = args.value.startDate;
                _endDate = args.value.endDate;
              }
            },
            showActionButtons: true,
            onSubmit: (Object? val) {
              Navigator.pop(context);
              onDateSelected(_startDate, _endDate);
            },
            onCancel: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

String formateDate(DateTime? date) {
  return date != null ? DateFormat("dd/MM/yyyy").format(date) : "Select date";
}

void showSelectionDialog(
  BuildContext context,
  List<Map<String, dynamic>> items,
  String title,
  Function(Map<String, dynamic>) onSelected,
) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(title),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    leading: Icon(
                      item["icon"],
                      color: item["iconColor"],
                    ),
                    title: Text(item["label"],
                        style: TextStyle(color: item["color"])),
                    onTap: () {
                      Navigator.pop(context, item["label"]);
                    },
                  );
                },
              ),
            ),
          )).then((selectedLabel) {
    if (selectedLabel != null) {
      final selectedItem = items.firstWhere(
        (item) => item["label"] == selectedLabel,
        orElse: () => items[0],
      );
      onSelected(selectedItem);
    }
  });
}
