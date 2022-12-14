import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobigic_test/application/common_provider.dart';
import 'package:mobigic_test/presentation/home_screen.dart';
import 'package:mobigic_test/presentation/widgets/container_with_border.dart';
import 'package:mobigic_test/presentation/widgets/custom_button.dart';
import 'package:mobigic_test/presentation/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class Puzzle extends StatelessWidget {
  const Puzzle({super.key});

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
              height: int.parse(
                      Provider.of<CommonProvider>(context)
                          .controllerN
                          .text) *
                  90,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: int.parse(
                        Provider.of<CommonProvider>(context)
                            .controllerM
                            .text)),
                children: [
                  for (int i = 0;
                      i <
                          Provider.of<CommonProvider>(context)
                              .controllerX
                              .text
                              .length;
                      i++)
                    Center(
                      child: ContainerWithBorder(
                        borderColor: Colors.black45,
                        boxColor: Provider.of<CommonProvider>(context)
                                .list
                                .contains(i)
                            ? Colors.amber
                            : Colors.white,
                        margin: EdgeInsets.all(2.sp),
                        borderRadius: 10.sp,
                        child: Text(
                          Provider.of<CommonProvider>(context)
                              .controllerX
                              .text[i]
                              .toUpperCase(),
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
              controller: Provider.of<CommonProvider>(context)
                  .controllerSearch,
            ),
            SizedBox(
              height: 36.h,
            ),
            CustomButton(
              lable: 'Search',
              onTap: () {
                Provider.of<CommonProvider>(context, listen: false).search();
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
