import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _hesoA = TextEditingController();
  TextEditingController _hesoB = TextEditingController();
  String _ketqua = '';
  @override
  void dispose() {
    _hesoA.dispose();
    _hesoB.dispose();
    super.dispose();
  }
  void _solveEquation() {
    double a = double.tryParse(_hesoA.text) ?? 0;
    double b = double.tryParse(_hesoB.text) ?? 0;

    if (a == 0) {
      setState(() {
        _ketqua = 'Phương trình không phải là phương trình bậc nhất.';
      });
    } else {
      double x = -b / a;
      setState(() {
        _ketqua = 'Nghiệm của phương trình là: x = $x';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5AB29),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ),
        title: Text('Calculator',
            style:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
        centerTitle: true,
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _hesoA,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Nhập hệ số a'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _hesoB,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Nhập hệ số b'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _solveEquation,
                  child: Text('Giải'),
                ),
                SizedBox(height: 20),
                Text(
                  _ketqua,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
