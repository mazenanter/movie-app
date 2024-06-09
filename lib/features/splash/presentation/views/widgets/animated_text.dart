import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        style: const TextStyle(fontSize: 70),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'NETFLIX',
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              speed: const Duration(
                milliseconds: 150,
              ),
            ),
          ],
          isRepeatingAnimation: false,
          repeatForever: false,
          displayFullTextOnTap: false,
        ),
      ),
    );
  }
}
