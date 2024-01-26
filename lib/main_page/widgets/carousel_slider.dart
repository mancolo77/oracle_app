import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:oracle_app_2/controller/app_controller.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});
  final AppController homeController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
       return Obx(
      () {
        if (homeController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (homeController.photos.isEmpty) {
          return const Center(
            child: Text('No images available'),
          );
        } else {
          return CarouselSlider.builder(
            itemCount: homeController.photos.length,
            options: CarouselOptions(
              height: 300,
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 2.0,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  homeController.photos[index].url!,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const CupertinoActivityIndicator();
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
              );
            },
          );
        }
      }
       );
      }
  }
