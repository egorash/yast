import 'package:get/get.dart';
import 'package:yast/pages/home_page.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const CADASTRO = '/cadastro';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const HomePage(),
    )
  ];
}
