import 'package:aara_task/app/api/provider/api_handlers.dart';
import 'package:aara_task/app/constants/assets.dart';
import 'package:aara_task/app/models/category_response.dart';
import 'package:aara_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: controller.obx(
          (state) => SingleChildScrollView(
                child: Column(
                  children: [
                    _searchBox(),
                    _categoryList(state!.responseData!.data!)
                  ],
                ),
              ),
          onEmpty: ApiHandler().emptyWidget()),
    );
  }

  Widget _searchBox() => Container(
    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
    margin: EdgeInsets.all(8),
    width: Get.width,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Expanded(child: Obx(() => Text(controller.currentAddress.value))),
        IconButton(icon: Icon(Icons.search), onPressed: () => controller.onLocChanged()),
        IconButton(icon: Icon(Icons.location_on_sharp), onPressed: () => controller.getCurrentPosition()),
      ],
    ),
  );

  Widget _categoryList(List<Data> data) => ListView.builder(
        itemBuilder: (_, i) => InkWell(
            onTap: () => Get.toNamed(Routes.SUB_CATEGORY, arguments: data[i]),
            child: _catItemCard(data[i])),
        // separatorBuilder: (_, i) => Divider(),
        itemCount: data.length,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
      );

  Widget _catItemCard(Data data) => Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(0.3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Text(
                        data.title!,
                        style: Get.textTheme.headline6!.copyWith(fontSize: 18),
                      ),
                    ),
                    // SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text((data.category != null
                          ? data.category!.isEmpty
                              ? 'No Category'
                              : data.category
                          : 'No Category')!),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text((data.description != null
                          ? data.description!.isEmpty
                              ? 'No description'
                              : data.description
                          : 'No description')!),
                    )
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              kPlaceholderSvg,
              height: 100,
            )
          ],
        ),
      );
}
