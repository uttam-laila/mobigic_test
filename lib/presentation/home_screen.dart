import 'package:flutter/material.dart';
import 'package:mobigic_test/presentation/puzzle_screen.dart';
import 'package:mobigic_test/presentation/widgets/custom_button.dart';
import 'package:mobigic_test/presentation/widgets/custom_text_field.dart';

TextEditingController _controllerM = TextEditingController();
TextEditingController _controllerN = TextEditingController();
TextEditingController _controllerX = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _controllerM.clear();
    _controllerN.clear();
    _controllerX.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container()),
            CustomTextField(
              hintText: 'Enter m for mxn',
              controller: _controllerM,
              onChanged: (p0) {
                setState(() {});
              },
              inputType: TextInputType.number,
            ),
            CustomTextField(
                hintText: 'Enter n for mxn',
                controller: _controllerN,
                onChanged: (p0) {
                  setState(() {});
                },
                inputType: TextInputType.number),
            if (_controllerM.text != '' && _controllerN.text != '')
              CustomTextField(
                hintText:
                    'Enter ${int.parse(_controllerM.text) * int.parse(_controllerN.text)} letters',
                controller: _controllerX,
                maxLength:
                    int.parse(_controllerM.text) * int.parse(_controllerN.text),
                inputType: TextInputType.text,
              ),
            CustomButton(
              lable: 'Proceed',
              onTap: () async {
                if (_controllerX.text.length <
                    int.parse(_controllerM.text) *
                        int.parse(_controllerN.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Please Enter ${int.parse(_controllerM.text) * int.parse(_controllerN.text)} letters!')));
                } else {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return SafeArea(
                        child: Puzzle(
                      m: int.parse(_controllerM.text),
                      n: int.parse(_controllerN.text),
                      x: _controllerX.text,
                    ));
                  }), (route) => false);
                }
              },
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
