// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/src/models/anime.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopAnimesImageSlider extends StatefulWidget {
  const TopAnimesImageSlider({super.key, required this.animes});

  final Iterable<Anime> animes;

  @override
  _TopAnimesImageSliderState createState() => _TopAnimesImageSliderState();
}

class _TopAnimesImageSliderState extends State<TopAnimesImageSlider> {
  int _currentPageIndex = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.animes.length,
            itemBuilder: (context, index, realIndex) {
              final anime = widget.animes.elementAt(index);
              return TopAnimePicture(
                anime: anime,
              );
            },
            options: CarouselOptions(
              enlargeFactor: 0.22,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              aspectRatio: 16 / 9,
              viewportFraction: 0.88,
              autoPlay: true,
              enlargeCenterPage: true,
              initialPage: _currentPageIndex,
            ),
          ),
          const SizedBox(height: 20),

          // Page Indicator
          AnimatedSmoothIndicator(
            activeIndex: _currentPageIndex,
            count: widget.animes.length,
            effect: CustomizableEffect(
              activeDotDecoration: DotDecoration(
                rotationAngle: 180,
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.blue,
                width: 28.0,
                height: 8.0,
              ),
              dotDecoration: DotDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).primaryColor,
                width: 28.0,
                height: 8.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopAnimePicture extends StatelessWidget {
  const TopAnimePicture({
    super.key,
    required this.anime,
  });

  final Anime anime;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            anime.node.mainPicture.medium,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
