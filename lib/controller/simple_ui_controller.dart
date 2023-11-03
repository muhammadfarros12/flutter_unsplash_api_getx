import 'package:flutter_unsplash_api_getx/model/photos_model.dart';
import 'package:flutter_unsplash_api_getx/service/api_service.dart';
import 'package:get/get.dart';

class SimpleUIController extends GetxController {
  var selectedIndex = 0.obs;

  RxList<PhotosModel> photos = RxList();

  List<String> orders = [
    'latest',
    'oldest',
    'populer',
    'views',
  ];

  // get
  Future<void> getPhotos() async {
    var response = await ApiService().getMethod('https://api.unsplash.com/photos?per_page=30&order_by=latest&client_id=cWFCysdjffCFlEePFNBl2xAosrG93S2HyDBVahBte5A');

    if (response.statusCode == 200) {
      response.data.forEach((elm){
        photos.add(PhotosModel.fromJson(elm));
      });
    }
  }

  @override
  void onInit() {
    getPhotos();
    super.onInit();
  }
}