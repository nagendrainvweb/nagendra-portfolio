import 'package:get/get.dart';
import 'package:personal_web/constants/types.dart';

class MainController extends GetxController {
  Pages selectedPage = Pages.HOME;
  int selectedPageNum = 0;

  updatePage({required Pages page, required int pageNum}) {
    selectedPage = page!=null?page:selectedPage;
    selectedPageNum = pageNum!=null?pageNum:selectedPageNum;
    update();
  }
}
