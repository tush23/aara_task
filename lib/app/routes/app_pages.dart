import 'package:get/get.dart';

import 'package:aara_task/app/modules/home/bindings/home_binding.dart';
import 'package:aara_task/app/modules/home/views/home_view.dart';
import 'package:aara_task/app/modules/subCategory/bindings/sub_category_binding.dart';
import 'package:aara_task/app/modules/subCategory/views/sub_category_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SUB_CATEGORY,
      page: () => SubCategoryView(),
      binding: SubCategoryBinding(),
    ),
  ];
}
