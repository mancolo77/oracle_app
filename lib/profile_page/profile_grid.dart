import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oracle_app_2/controller/app_controller.dart';
import 'package:oracle_app_2/controller/photos_model.dart';
import 'package:oracle_app_2/main_page/widgets/detail_view.dart';


class ProfileGrid extends StatelessWidget {
  const ProfileGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController homeController = Get.find<AppController>();
    return Expanded(
      flex: 2,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!homeController.isLoading.value &&
              scrollInfo is ScrollEndNotification &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          }
          return false;
        },
        child: Obx(
          () => homeController.isLoading.value
              ? const Center()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: homeController.photos.length + 1,
                    itemBuilder: (context, index) {
                      if (index < homeController.photos.length) {
                        final item = homeController.photos[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => DetailsView(index: index),
                              ),
                            );
                          },
                          child: Hero(
                            tag: item.id!,
                            child: GridItem(item: item),
                          ),
                        );
                      } else {
                      }
                      return null;
                    },
                  ),
                ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.item});

  final PhotosModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: Image.network(
        item.url!,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return const Icon(
            Icons.image_not_supported_rounded,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
