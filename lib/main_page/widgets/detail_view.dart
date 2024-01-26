import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oracle_app_2/controller/app_controller.dart';

class DetailsView extends StatelessWidget {
  DetailsView({super.key, required this.index});
  final int index;

  final AppController homeController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0), // Adjust the padding as needed
        width: double.infinity,
        height: double.infinity,
        child: Hero(
          tag: homeController.photos[index].id!,
          child: Image.network(
            homeController.photos[index].url!,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (BuildContext context, Object error,
                StackTrace? stackTrace) {
              return const Icon(
                Icons.image_not_supported_rounded,
                color: Colors.grey,
              );
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
