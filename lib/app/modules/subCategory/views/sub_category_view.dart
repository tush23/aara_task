import 'package:aara_task/app/api/provider/api_handlers.dart';
import 'package:aara_task/app/constants/assets.dart';
import 'package:aara_task/app/models/sub_category_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/sub_category_controller.dart';

class SubCategoryView extends GetView<SubCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.data.title ?? 'Sub Category'),
        centerTitle: true,
      ),
      body: controller.obx((state) => _categoryList(state!.responseData!.data!),
          onEmpty: ApiHandler().emptyWidget()),
    );
  }

  Widget _categoryList(List<Data> data) => ListView.builder(
        itemBuilder: (_, i) => _catItemCard(data[i]),
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
                      child: Text(data.unicode??'No Unicode'),
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
