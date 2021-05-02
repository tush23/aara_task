import 'package:aara_task/app/api/provider/api_provider.dart';
import 'package:aara_task/app/models/category_response.dart' as catResponse;
import 'package:aara_task/app/models/sub_category_response.dart';
import 'package:get/get.dart';

class SubCategoryController extends GetxController with StateMixin<SubCategoryResponse> {
  ApiProvider _apiProvider = Get.find();
  catResponse.Data data=Get.arguments;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _getSubCategories();
    change(null,status: RxStatus.loading());
  }

  @override
  void onClose() {
    super.onClose();
  }
  _getSubCategories() {
    _apiProvider.getSubCategory().then((value) {
      if (value.isOk) {
        SubCategoryResponse _data = SubCategoryResponse.fromJson(value.body);
        if (_data.responseData!.data!.isNotEmpty) {
          change(_data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      }
    });
  }

}
