import 'package:flutter/material.dart';
import 'package:throtl/core/utils/themes/pallete.dart';

class Loader extends StatelessWidget {
  final bool? isLinear;
  const Loader({super.key, this.isLinear});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLinear == null || isLinear == false
          ? const CircularProgressIndicator(
              color: AppColors.cardHeading,
            )
          : const LinearProgressIndicator(
              color: AppColors.cardHeading,
            ),
    );
  }
}
