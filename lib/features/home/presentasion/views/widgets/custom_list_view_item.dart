import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/features/home/presentasion/manager/popular_cubit/popular_cubit.dart';
import 'package:movie_app/features/home/presentasion/views/home_details_view.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_list_indicator.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/movie_item.dart';

class PopularListViewItem extends StatelessWidget {
  const PopularListViewItem({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularCubit, PopularState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PopularSuccessState) {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => MovieItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailsView(
                        movieModel: state.movies[index],
                      ),
                    ),
                  );
                },
                height: height,
                width: width,
                movieModel: state.movies[index],
              ),
              itemCount: state.movies.length,
            ),
          );
        } else if (state is PopularErrorState) {
          return Center(child: Text(state.errMsg));
        }
        return const CustomListIndicator();
      },
    );
  }
}
