import 'package:flutter_unsplash_api_getx/model/photos_model.dart';
import 'package:flutter_unsplash_api_getx/service/api_service.dart';
import 'package:get/get.dart';

class SimpleUIController extends GetxController {
  var selectedIndex = 0.obs;

  RxList<PhotosModel> photos = RxList();

  RxBool isLoading = true.obs;

  RxString orderBy = "latest".obs;

  List<String> orders = [
    'latest',
    'oldest',
    'populer',
    'views',
  ];

  // get
  Future<void> getPhotos() async {
    isLoading.value = true;
    var response = await ApiService().getMethod('https://api.unsplash.com/photos?per_page=30&order_by=${orderBy.value}&client_id=cWFCysdjffCFlEePFNBl2xAosrG93S2HyDBVahBte5A');

    photos = RxList();
    if (response.statusCode == 200) {
      response.data.forEach((elm){
        photos.add(PhotosModel.fromJson(elm));
      });
      isLoading.value = false;
    }
  }

  orderFunc(String newVal){
    orderBy.value = newVal;
    getPhotos();
  }

  @override
  void onInit() {
    getPhotos();
    super.onInit();
  }
}