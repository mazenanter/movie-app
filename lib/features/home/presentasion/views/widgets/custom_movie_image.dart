import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CusomMovieImage extends StatelessWidget {
  const CusomMovieImage({
    super.key,
    required this.height,
    required this.width,
    required this.movieImage,
  });

  final double height;
  final double width;
  final String movieImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://image.tmdb.org/t/p/w500$movieImage',
      width: MediaQuery.sizeOf(context).width * 0.30,
      errorWidget: (context, url, error) => const Icon(
        Icons.error_outline,
      ),
    );
  }
}
