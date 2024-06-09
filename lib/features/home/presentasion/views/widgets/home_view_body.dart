import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/build_foreground_ui.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_background_image_filter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          CustomBackgroundImageFilter(),
          BuildForegroundUi(),
        ],
      ),
    );
  }
}
