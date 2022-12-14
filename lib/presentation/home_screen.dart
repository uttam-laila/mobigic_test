import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobigic_test/application/common_provider.dart';
import 'package:mobigic_test/presentation/core/constants.dart';
import 'package:mobigic_test/presentation/puzzle_screen.dart';
import 'package:mobigic_test/presentation/widgets/container_with_border.dart';
import 'package:mobigic_test/presentation/widgets/custom_button.dart';
import 'package:mobigic_test/presentation/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container()),
            Icon(
              Icons.gamepad,
              color: AppConstants.green,
              size: 36.sp,
            ),
            SizedBox(
              height: 42.h,
            ),
            ContainerWithBorder(
              borderRadius: 12.sp,
              borderColor: AppConstants.textColor,
              child: CustomTextField(
                prefixIcon: const Text('  '),
                hintText: 'Enter m for mxn',
                controller: Provider.of<CommonProvider>(context).controllerM,
                inputType: TextInputType.number,
                onChanged: (_) {
                  Provider.of<CommonProvider>(context, listen: false)
                      .setState();
                },
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            ContainerWithBorder(
              borderRadius: 12.sp,
              borderColor: AppConstants.textColor,
              child: CustomTextField(
                textCapitalization: TextCapitalization.characters,
                prefixIcon: const Text('  '),
                hintText: 'Enter n for mxn',
                controller: Provider.of<CommonProvider>(context).controllerN,
                inputType: TextInputType.number,
                onChanged: (_) {
                  Provider.of<CommonProvider>(context, listen: false)
                      .setState();
                },
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            if (Provider.of<CommonProvider>(context).controllerM.text != '' &&
                Provider.of<CommonProvider>(context).controllerN.text != '')
              ContainerWithBorder(
                borderRadius: 12.sp,
                borderColor: AppConstants.textColor,
                child: CustomTextField(
                  prefixIcon: const Text('  '),
                  hintText:
                      'Enter ${int.parse(Provider.of<CommonProvider>(context).controllerM.text) * int.parse(Provider.of<CommonProvider>(context).controllerN.text)} letters',
                  controller: Provider.of<CommonProvider>(context).controllerX,
                  maxLength: int.parse(Provider.of<CommonProvider>(context)
                          .controllerM
                          .text) *
                      int.parse(Provider.of<CommonProvider>(context)
                          .controllerN
                          .text),
                  inputType: TextInputType.text,
                ),
              ),
            if (Provider.of<CommonProvider>(context).controllerM.text != '' &&
                Provider.of<CommonProvider>(context).controllerN.text != '')
              SizedBox(
                height: 32.h,
              ),
            CustomButton(
              lable: 'Proceed',
              onTap: () async {
                if (Provider.of<CommonProvider>(context, listen: false)
                        .controllerX
                        .text
                        .length <
                    int.parse(
                            Provider.of<CommonProvider>(context, listen: false)
                                .controllerM
                                .text) *
                        int.parse(
                            Provider.of<CommonProvider>(context, listen: false)
                                .controllerN
                                .text)) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Please Enter ${int.parse(Provider.of<CommonProvider>(context, listen: false).controllerM.text) * int.parse(Provider.of<CommonProvider>(context, listen: false).controllerN.text)} letters!')));
                } else {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return const SafeArea(child: Puzzle());
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
