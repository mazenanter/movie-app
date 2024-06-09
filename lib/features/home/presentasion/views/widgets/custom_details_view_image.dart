import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_fading_indicator.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

class CustomDetailsViewImage extends StatelessWidget {
  const CustomDetailsViewImage({
    super.key,
    required this.movieModel,
    required this.width,
  });

  final MovieModel movieModel;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      height: MediaQuery.sizeOf(context).height * 0.5,
      imageUrl:
          'https://image.tmdb.org/t/p/original/${movieModel.backdropPath}',
      placeholder: (context, url) => CustomFadingIndicator(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          color: Colors.grey[600],
          width: width,
        ),
      ),
    );
  }
}
