import 'package:get/get.dart';
import 'package:weeksebelas/data/dao/barang_dao.dart';
import 'package:weeksebelas/data/database/db_helper.dart';
import 'package:weeksebelas/data/repo/barang_repo.dart';
import 'package:weeksebelas/presentation/controller/barang_controller.dart';


abstract class Appbinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DbHelper());

    Get.put(BarangDao(Get.find<DbHelper>()));
    Get.put<BarangRepo>(BarangRepoImpl(Get.find<BarangDao>()));
    Get.put(BarangController(Get.find<BarangRepo>()));
  }
}