// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/prgress_indicator_and_rating.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
    required this.rating,
  });
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(rating, style: Theme.of(context).textTheme.displayLarge)),
        Expanded(
          flex: 7,
          child: Column(
            children: const [
              TRatingProgressIndicator(
                text: '5',
                value: .85,
              ),
              TRatingProgressIndicator(
                text: '4',
                value: .75,
              ),
              TRatingProgressIndicator(
                text: '3',
                value: .65,
              ),
              TRatingProgressIndicator(
                text: '2',
                value: .25,
              ),
              TRatingProgressIndicator(
                text: '1',
                value: .25,
              ),
            ],
          ),
        )
      ],
    );
  }
}
