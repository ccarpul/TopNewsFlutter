import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator(
      {super.key, required this.controller, required this.length});

  final PageController controller;
  final int length;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    if(length < 1) return const SizedBox();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      child: SmoothPageIndicator(
        controller: controller,
        count: length,
        effect: ScrollingDotsEffect(
          dotHeight: 8,
          dotWidth: 8,
          spacing: 4,
          dotColor: Colors.grey,
          activeDotColor: colors.primary,
          maxVisibleDots: 9
        ),
      ),
    );
  }
}
