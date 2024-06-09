import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_fading_indicator.dart';

class CustomItemFadingIndicator extends StatelessWidget {
  const CustomItemFadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return CustomFadingIndicator(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.27,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.01),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.30,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  width: width * 0.66,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width * 0.5,
                            child: Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 5,
                        width: double.infinity,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
