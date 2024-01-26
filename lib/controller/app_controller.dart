import 'package:get/get.dart';
import 'package:oracle_app_2/controller/api_service.dart';
import 'package:oracle_app_2/controller/photos_model.dart';

class AppController extends GetxController{
  RxList<PhotosModel> photos = RxList();
  RxBool isLoading = false.obs;
  var selectedIndex = 0.obs;
  var index = 0;
int _currentPage = 1;
  Future<void>getPictureData() async {
  isLoading.value = true;
  try {
    var response = await DioService.getURL('https://jsonplaceholder.typicode.com/photos');
    photos.clear();

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        photos.add(PhotosModel.fromJson(element));
      });
      isLoading.value = false;
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}
  Future<void> searchByIndex(String index) async {
    isLoading.value = true;
    try {
      var response = await DioService.getURL('https://jsonplaceholder.typicode.com/photos/$index');
      if (response.statusCode == 200) {
        photos.clear();
        photos.add(PhotosModel.fromJson(response.data));
        isLoading.value = false;
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  // New method for SearchPage
  Future<void> searchPhotos(String index) async {
    isLoading.value = true;
    try {
      var response = await DioService.getURL('https://jsonplaceholder.typicode.com/photos/$index');
      if (response.statusCode == 200) {
        // Assuming you have a separate list for search results
        photos.clear();  // Clear existing photos
        photos.add(PhotosModel.fromJson(response.data));  // Add search results to photos
        isLoading.value = false;
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

    Future<void> loadMorePhotos() async {
    _currentPage++;
    await getPictureData();
  }
    List<PhotosModel> get displayedPhotos {
    return photos.take(10).toList();
  }
    bool get hasMorePhotos {
    return photos.length < _currentPage * 10;
  }
  @override
  void onInit(){
    getPictureData();
    super.onInit();
  }
}