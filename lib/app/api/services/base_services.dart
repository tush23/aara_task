import 'package:get/get_connect/http/src/response/response.dart';

abstract class BaseApiServices {
  Future<Response> getCategory();
  Future<Response> getSubCategory();

}
