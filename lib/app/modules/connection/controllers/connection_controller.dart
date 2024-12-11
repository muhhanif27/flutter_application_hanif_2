import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../views/no_connection_view.dart';

class ConnectionController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  String? _lastRoute; // Variabel untuk menyimpan rute terakhir

  @override
  void onInit() {
    super.onInit();
    // Simpan rute pertama saat aplikasi berjalan
    _lastRoute = Get.currentRoute;

    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      _updateConnectionStatus(connectivityResult.first);
    });
  }

  // void _updateConnectionStatus(ConnectivityResult connectivityResult) {
  //   // Jika tidak ada koneksi
  //   if (connectivityResult == ConnectivityResult.none) {
  //     _lastRoute = Get.currentRoute; // Simpan rute saat ini sebelum berpindah
  //     Get.offAll(() => const NoConnectionView());
  //   } else {
  //     // Jika koneksi pulih
  //     if (_lastRoute != null && _lastRoute != '/NoConnectionView') {
  //       // Gunakan Get.toNamed untuk kembali tanpa menghapus tumpukan navigasi
  //       Get.toNamed(_lastRoute!);
  //     } else {
  //       Get.offAll(() => const HomeView());
  //     }
  //   }
  // }

  // void _updateConnectionStatus(ConnectivityResult connectivityResult) {
  //   // Jika tidak ada koneksi
  //   if (connectivityResult == ConnectivityResult.none) {
  //     _lastRoute = Get.currentRoute; // Simpan rute saat ini sebelum berpindah
  //     Get.offAll(() => const NoConnectionView());
  //   } else {
  //     // Jika koneksi pulih
  //     if (_lastRoute != null && _lastRoute != '/NoConnectionView') {
  //       // Gunakan Get.toNamed untuk kembali tanpa menghapus tumpukan navigasi
  //       Get.toNamed(_lastRoute!);
  //     } else {
  //       Get.offAll(() => const HomeView());
  //     }
  //   }
  // }

  // void _updateConnectionStatus(ConnectivityResult connectivityResult) {
  //   // kondisi dimana aplikasi mendeteksi bawha tidak ada koneksi sama sekali
  //   if (connectivityResult == ConnectivityResult.none) {
  //     Get.offAll(() => const NoConnectionView());
  //   } else {
  //     // else merupakan kondisi jika aplikasi terhubung dengan koneksi wifi atau mobile data
  //     if (Get.currentRoute == '/NoConnectionView') {
  //       Get.offAll(() => const HomeView());
  //     }
  //   }
  // }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      _lastRoute = Get.currentRoute; // Simpan rute saat ini sebelum berpindah
      Get.offAll(() => const NoConnectionView());
    } else {
      // Jika koneksi pulih
      if (_lastRoute != null && _lastRoute != '/NoConnectionView') {
        // Gunakan Get.offAllNamed untuk kembali ke rute terakhir dan menghapus tumpukan navigasi
        Get.offAllNamed(_lastRoute!); // Menghapus semua rute sebelumnya
      } else {
        // Jika tidak ada rute terakhir, langsung ke HomeView tanpa tombol back
        Get.offAll(() => const HomeView());
      }
    }
  }
}
