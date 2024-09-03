import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../custom_shapes/containers/circular_container.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
  });
  final String label;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(label) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(label),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor
            ? TCircularContainer(
                width: 50,
                height: 50,
                backGroundColor: THelperFunctions.getColor(label)!,
              )
            : null,
        labelPadding: isColor ? EdgeInsets.zero : null,
        shape: isColor ? const CircleBorder() : null,
        padding: isColor ? EdgeInsets.zero : null,
        backgroundColor: isColor ? THelperFunctions.getColor(label) : null,
      ),
    );
  }
}
