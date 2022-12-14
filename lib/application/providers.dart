import 'package:mobigic_test/application/common_provider.dart';
import 'package:mobigic_test/injection.dart';
import 'package:provider/provider.dart';

final List providers = [
  ChangeNotifierProvider<CommonProvider>(
    create: (context) => getIt<CommonProvider>(),
    lazy: false,
  ),
];
