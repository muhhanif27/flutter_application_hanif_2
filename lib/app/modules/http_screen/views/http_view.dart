// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../../../data/services/http_controller.dart';
// import '../../components/card_article.dart';

// class HttpView extends GetView<HttpController> {
//   const HttpView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HTTP'),
//         ),
//         body: Obx(() {
//           if (controller.isLoading.value) {
//             // Display a progress indicator while loading
//             return Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                     Theme.of(context).colorScheme.secondary),
//               ),
//             );
//           } else {
//             // Display the list of articles
//             return ListView.builder(
//               shrinkWrap: true,
//               itemCount: controller.articles.length,
//               itemBuilder: (context, index) {
//                 var article = controller.articles[index];
//                 return CardArticle(article: article);
//               },
//             );
//           }
//         }));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_hanif_2/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import '../../../data/services/http_controller.dart';
import '../../components/card_article.dart';

class HttpView extends GetView<HttpController> {
  const HttpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Arahkan ke HomeView saat tombol back ditekan
            Get.offAll(() => const HomeView());
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          // Display a progress indicator while loading
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
            ),
          );
        } else {
          // Display the list of articles
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              var article = controller.articles[index];
              return CardArticle(article: article);
            },
          );
        }
      }),
    );
  }
}
