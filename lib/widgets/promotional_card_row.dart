// PromotionalCardRow widget to display a horizontal list of PromotionalCards
import 'package:flutter/cupertino.dart';
import 'package:jumia_clone/widgets/promotional_card.dart';

class PromotionalCardRow extends StatelessWidget {
  final List<PromotionalCard> cards;

  const PromotionalCardRow({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: cards,
      ),
    );
  }
}