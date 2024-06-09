import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_details_info_widget.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_details_view_image.dart';

class HomeDetailsViewBody extends StatelessWidget {
  const HomeDetailsViewBody({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDetailsViewImage(movieModel: movieModel, width: width),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieModel.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      movieModel.voteAverage.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomDetailsInfoWidget(text: movieModel.originalLanguage!),
                    const SizedBox(
                      width: 8,
                    ),
                    const CustomDetailsInfoWidget(text: 'adventure'),
                    const SizedBox(
                      width: 8,
                    ),
                    const CustomDetailsInfoWidget(text: 'popularity'),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                    color: Color(0xff88A4E8),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movieModel.overview!,
                  style: const TextStyle(
                    color: Color(0xff9C9C9C),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
