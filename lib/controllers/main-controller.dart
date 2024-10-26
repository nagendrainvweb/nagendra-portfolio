import 'package:get/get.dart';
import 'package:personal_web/constants/types.dart';

class MainController extends GetxController {
  Rx<Pages> selectedPage = Pages.HOME.obs;
  RxInt selectedPageNum = 0.obs;

  updatePage({required Pages page, required int pageNum}) {
    selectedPage.value = page;
    selectedPageNum.value = pageNum;
    update();
  }
}
