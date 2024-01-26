import 'package:flutter/material.dart';
import 'package:oracle_app_2/global/texts.dart';
import 'package:oracle_app_2/main_page/widgets/carousel_slider.dart';
import 'package:oracle_app_2/main_page/widgets/grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      "Discover",
                      style: headerTextStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'WHAT’S NEW TODAY',
                      style: subheaderTextStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 300, // Set an initial height for Carousel
                    child: Carousel(),
                  ),
                  const SizedBox(height: 25),
                  const GridPicture(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
