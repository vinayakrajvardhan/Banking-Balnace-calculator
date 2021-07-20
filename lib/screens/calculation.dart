import 'package:balance_calculator/widgets/date_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  const Calculation({Key key}) : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  DateTime selectedDate = DateTime.now();
  // TextEditingController controller1 = TextEditingController();
  // TextEditingController controller2 = TextEditingController();
  // TextEditingController controller3 = TextEditingController();
  double firstFieldValue = 0;
  double secondFieldValue = 0;
  double thirdFieldValue = 0;
  double fourthFieldValue = 0;
  double fifthFieldValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.ac_unit_sharp,
          color: Colors.black.withOpacity(0.0),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().whenComplete(
                    () => Navigator.pop(context),
                  );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
        title: Text(
          'Bank Calculator',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Text(
              "Month First",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DatePickerNow(),
          TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() => firstFieldValue = 0);
                } else {
                  setState(() {
                    firstFieldValue = double.parse(value);
                  });
                }
              }),
          DatePickerNow(),
          TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() => secondFieldValue = 0);
                } else {
                  setState(() {
                    secondFieldValue = double.parse(value);
                  });
                }
              }),
          DatePickerNow(),
          TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() => thirdFieldValue = 0);
                } else {
                  setState(() {
                    thirdFieldValue = double.parse(value);
                  });
                }
              }),
          DatePickerNow(),
          TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() => fourthFieldValue = 0);
                } else {
                  setState(() {
                    fourthFieldValue = double.parse(value);
                  });
                }
              }),
          DatePickerNow(),
          TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() => fifthFieldValue = 0);
                } else {
                  setState(() {
                    fifthFieldValue = double.parse(value);
                  });
                }
              }),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Text(
              "Total:${firstFieldValue + secondFieldValue + thirdFieldValue + fourthFieldValue + fifthFieldValue}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Text(
              "Calcutor average:${(firstFieldValue + secondFieldValue + thirdFieldValue + fourthFieldValue + fifthFieldValue) / 30}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
