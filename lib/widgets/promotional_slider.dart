import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'carousel_item.dart';
import 'dots_indicator.dart';

class PromoSlider extends StatefulWidget {
  final List<String> imageUrls;

  const PromoSlider({required this.imageUrls, super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache images for smoother transitions
    for (final url in widget.imageUrls) {
      precacheImage(NetworkImage(url), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      return const SizedBox.shrink();
    }

    return VisibilityDetector(
      key: Key('promo-slider-${widget.imageUrls.hashCode}'),
      onVisibilityChanged: (info) {
        // Pause auto-play when not visible to save resources
        if (info.visibleFraction < 0.5) {
          _carouselController.startAutoPlay();
        } else {
          _carouselController.stopAutoPlay();
        }
      },
      child: Container(
        color: AppColors.surface,
        padding: const EdgeInsets.only(bottom: 1),
        child: Column(
          children: [
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: widget.imageUrls.length,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: false,
                viewportFraction: 0.85,
                height: 165,
                onPageChanged: (index, reason) {
                  setState(() => _currentIndex = index);
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return CarouselItem(imageUrl: widget.imageUrls[index]);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: IndicatorDots(
                currentIndex: _currentIndex,
                itemCount: widget.imageUrls.length,
                controller: _carouselController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
