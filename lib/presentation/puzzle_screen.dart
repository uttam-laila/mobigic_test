import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobigic_test/presentation/home_screen.dart';
import 'package:mobigic_test/presentation/widgets/container_with_border.dart';
import 'package:mobigic_test/presentation/widgets/custom_button.dart';
import 'package:mobigic_test/presentation/widgets/custom_text_field.dart';
import 'package:mobigic_test/presentation/widgets/search.dart';

TextEditingController _controller = TextEditingController();

class Puzzle extends StatefulWidget {
  const Puzzle({super.key, required this.m, required this.n, required this.x});
  final int m;
  final int n;
  final String x;

  @override
  State<Puzzle> createState() => _PuzzleState();
}

List<int> _list = [];

class _PuzzleState extends State<Puzzle> {
  @override
  void initState() {
    _list.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 120.h,
            ),
            SizedBox(
              height: widget.n * 90,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.m),
                children: [
                  for (int i = 0; i < widget.x.length; i++)
                    Center(
                      child: ContainerWithBorder(
                        borderColor: Colors.black45,
                        boxColor:
                            _list.contains(i) ? Colors.amber : Colors.white,
                        margin: EdgeInsets.all(2.sp),
                        borderRadius: 10.sp,
                        child: Text(
                          widget.x[i].toUpperCase(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomTextField(
              hintText: 'Enter text to search',
              controller: _controller,
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomButton(
              lable: 'Search',
              onTap: () {
                List<List<String>> val = [];

                for (var i = 0; i < widget.x.length; i += widget.m) {
                  List<String> xx = [];
                  for (var j = 0;
                      j < widget.x.substring(i, widget.m + i).length;
                      j++) {
                    xx.add(
                        widget.x.substring(i, widget.m + i)[j].toUpperCase());
                  }
                  val.add(xx);
                }
                setState(() {
                  _list = patternSearch(
                      val, widget.m, widget.n, _controller.text.toUpperCase());
                });
              },
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomButton(
              lable: 'Reset',
              onTap: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const SafeArea(child: HomePage());
                }), (route) => false);
              },
            ),
            SizedBox(
              height: 36.h,
            ),
          ],
        ),
      ),
    );
  }
}
