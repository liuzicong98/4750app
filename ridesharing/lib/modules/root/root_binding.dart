import 'package:get/get.dart';
import 'package:ridesharing/modules/root/root_logic.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootLogic>(() => RootLogic());
  }
}
