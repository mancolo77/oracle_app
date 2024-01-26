
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oracle_app_2/controller/app_controller.dart';
import 'package:oracle_app_2/global/texts.dart';
import 'package:oracle_app_2/search_page/widget/search_grid_picture.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final AppController homeController = Get.put(AppController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Search',
              style: headerTextStyle,
              ),
            const SizedBox(height: 32),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search all',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    homeController.searchPhotos(searchController.text);
                  },
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SearchGrid(),
          ],
        ),
      ),
    );
  }
}
