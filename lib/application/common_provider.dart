import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobigic_test/infrastructure/search.dart';

@injectable
class CommonProvider with ChangeNotifier {
  CommonProvider();

  TextEditingController controllerM = TextEditingController();
  TextEditingController controllerN = TextEditingController();
  TextEditingController controllerX = TextEditingController();
  TextEditingController controllerSearch = TextEditingController();

  List<int> list = [];

  clearData() {
    controllerM.clear();
    controllerN.clear();
    controllerX.clear();
    controllerSearch.clear();
    list.clear();
  }

  void setState() {
    notifyListeners();
  }

  Future<void> search() async{
    List<List<String>> val = [];

    for (var i = 0;
        i < controllerX.text.length;
        i += int.parse(controllerM.text)) {
      List<String> xx = [];
      for (var j = 0;
          j <
              controllerX.text
                  .substring(i, int.parse(controllerM.text) + i)
                  .length;
          j++) {
        xx.add(controllerX.text
            .substring(i, int.parse(controllerM.text) + i)[j]
            .toUpperCase());
      }
      val.add(xx);
    }

    list = patternSearch(val, int.parse(controllerM.text),
        int.parse(controllerN.text), controllerSearch.text.toUpperCase());
    notifyListeners();
  }
}
