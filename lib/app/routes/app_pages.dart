import 'package:flutter_application_hanif_2/app/modules/article_detail/bindings/article_detail_binding.dart';
import 'package:flutter_application_hanif_2/app/modules/article_detail/views/article_detail_view.dart';
import 'package:flutter_application_hanif_2/app/modules/article_detail/views/article_detail_web_view.dart';
import 'package:flutter_application_hanif_2/app/modules/connection/bindings/connection_binding.dart';
import 'package:flutter_application_hanif_2/app/modules/connection/views/no_connection_view.dart';
import 'package:flutter_application_hanif_2/app/modules/http_screen/bindings/http_binding.dart';
// import 'package:flutter_application_hanif_2/app/modules/http_screen/views/home_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/http_screen/views/http_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HTTP,
      page: () => const HttpView(),
      binding: HttpBinding(),
    ),
    GetPage(
        name: _Paths.ARTICLE_DETAILS,
        page: () => ArticleDetailPage(article: Get.arguments),
        binding: ArticleDetailBinding()),
    GetPage(
        name: _Paths.ARTICLE_DETAILS_WEBVIEW,
        page: () => ArticleDetailWebView(article: Get.arguments),
        binding: ArticleDetailBinding()),
    GetPage(
      name: _Paths.CONNECTION,
      page: () => NoConnectionView(),
      binding: ConnectionBinding(),
    ),
  ];
}
