// PromotionalCardGrid widget to display a grid of PromotionalCards
import 'package:flutter/cupertino.dart';
import 'package:jumia_clone/theme/colors.dart';
import 'package:jumia_clone/widgets/promotional_card.dart';

class PromotionalCardGrid extends StatelessWidget {
  final List<PromotionalCard> cards;

  const PromotionalCardGrid({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true, // Prevents GridView from taking infinite height
        physics: const NeverScrollableScrollPhysics(), // Disables scrolling (if inside a scrollable parent)
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        mainAxisSpacing: 8.0, // Spacing between rows
        crossAxisSpacing: 2.0, // Spacing between columns
        childAspectRatio: 1 / 1.4, // Adjust ratio to fit card and label
        children: cards,
      ),
    );
  }
}
