import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personal_web/constants/types.dart';
import 'package:personal_web/controllers/main-controller.dart';

changePage(BuildContext context, Pages page) {
  int? pageNum;
  if (page == Pages.HOME) {
    pageNum = 0;
  } else if (page == Pages.ABOUT) {
    pageNum = 1;
  } else if (page == Pages.SKILLS) {
    pageNum = 2;
  } else if (page == Pages.PORTFOLIO) {
    pageNum = 3;
  }
  Get.find<MainController>().updatePage(page: page, pageNum: pageNum!);
  // Navigator.pushReplacementNamed(context, pageRoute!);
}
