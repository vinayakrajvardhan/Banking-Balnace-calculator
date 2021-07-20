import 'package:flutter/material.dart';

class DatePickerNow extends StatefulWidget {
  const DatePickerNow({Key key}) : super(key: key);

  @override
  _DatePickerNowState createState() => _DatePickerNowState();
}

class _DatePickerNowState extends State<DatePickerNow> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${selectedDate.day}".split(' ')[0],
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          onPressed: () => _selectDate(context), // Refer step 3
          child: Text(
            'Select date',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
