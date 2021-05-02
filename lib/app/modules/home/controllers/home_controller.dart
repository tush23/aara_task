import 'package:aara_task/app/api/provider/api_handlers.dart';
import 'package:aara_task/app/api/provider/api_provider.dart';
import 'package:aara_task/app/custom/search_locality.dart';
import 'package:aara_task/app/models/category_response.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';

class HomeController extends GetxController with StateMixin<CategoryResponse> {
  // Position _currentPosition;

  var currentAddress = 'Searching...'.obs;
  ApiProvider _apiProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
    getCurrentPosition();
  }

  @override
  void onReady() {
    super.onReady();
    _getCategories();
    change(null, status: RxStatus.loading());
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCurrentPosition() async {
    print('Getting user location');
    // verify permissions
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
    }
    // get current position
    try {
      Position _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      _getGeolocationAddress(_currentPosition);
      // LATTITUDE.value = _currentPosition.latitude.toString();
      // LONGITUDE.value = _currentPosition.longitude.toString();
    } catch (e) {
      ApiHandler().noLocationDialog(_openLocSettings);
    }
    // get address
  }
  _openLocSettings() async {
    await Geolocator.openAppSettings();
    await Geolocator.openLocationSettings();
    Future.delayed(Duration(seconds: 3), () {
      getCurrentPosition();
      // if(Get.isDialogOpen){
      //   Get.back();
      // }
    });
  }

  _getGeolocationAddress(Position position) async {
    var places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (places.isNotEmpty) {
      final Placemark place = places.first;
      // print(
      //     "Name-${place.name}, Locality-${place.locality},postalCode-${place.postalCode},street${place.street},subLocality${place.subLocality},administrativeArea${place.administrativeArea},subThoroughfare${place.subThoroughfare},,thoroughfare${place.thoroughfare},");
      // currentAddress.value =`
      //     "${place.name}, ${place.locality},${place.postalCode},${place.street},${place.subLocality}";
      //print(currentAddress);
      print(place);
      String add = place.name.toString() +
          "," +
          place.subLocality.toString() +
          "," +
          place.subAdministrativeArea.toString() +
          "," +
          place.postalCode.toString();
      print(add);
      currentAddress.value = add;

      print('-----------Address---------------');
      print(currentAddress.toString());
    }
  }

  onLocChanged() {
    Get.to(SearchLocality())!.then((value) async {
      if (value != null) {
        PlacesSearchResult placesSearchResult = value;
        print('------- ${placesSearchResult.formattedAddress}');
        currentAddress.value=placesSearchResult.formattedAddress!;
        // var addresses = await Geocoder.local
        //     .findAddressesFromQuery(placesSearchResult.formattedAddress);
        // currentAddress.value = addresses.first;
        // print("----------${first.coordinates.latitude} : ${first.coordinates}");
      }
    });
  }

  _getCategories() {
    _apiProvider.getCategory().then((value) {
      if (value.isOk) {
        CategoryResponse _data = CategoryResponse.fromJson(value.body);
        if (_data.responseData!.data!.isNotEmpty) {
          change(_data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      }
    });
  }
}
