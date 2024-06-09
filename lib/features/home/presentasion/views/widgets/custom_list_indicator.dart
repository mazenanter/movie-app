import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_item_fading_indicator.dart';

class CustomListIndicator extends StatelessWidget {
  const CustomListIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => CustomItemFadingIndicator(),
        itemCount: 15,
      ),
    );
  }
}
