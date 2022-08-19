import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/banner.dart';
import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/services/home.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  // banner loading
  RxBool bannerLoading = true.obs;
  // category loading
  RxBool categoryLoading = true.obs;
  // sub category loading
  RxBool subCategoryLoading = true.obs;

  // Banner list
  var bannerList = <BannerModel>[].obs;
  // Category list
  var categoryList = <CategoryModel>[].obs;
  // sub category list
  var subCategoryList = <CategoryModel>[].obs;

  // Banner Function
  void getBanners() async {
    bannerLoading.value = true;
    try {
      bannerList.value = await HomeService.getBanners(
        ConstantStrings.kBannerAPI,
      );
    } finally {
      bannerLoading.value = false;
    }
  }

  // Category Function
  void getCategories() async {
    categoryLoading.value = true;
    try {
      categoryList.value = await HomeService.getCategories(
        ConstantStrings.kCategoryAPI,
      );
    } finally {
      categoryLoading.value = false;
    }
  }

  // Sub Category Function
  void getSubCategories(int categoryId) async {
    subCategoryLoading.value = true;
    try {
      subCategoryList.value = await HomeService.getCategories(
        ConstantStrings.kSubCategoryAPI + categoryId.toString(),
      );
    } finally {
      subCategoryLoading.value = false;
    }
  }
}
