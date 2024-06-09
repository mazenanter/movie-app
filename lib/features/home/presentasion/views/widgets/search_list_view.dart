import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentasion/manager/search_cubit/search_cubit.dart';
import 'package:movie_app/features/home/presentasion/views/home_details_view.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_list_indicator.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/movie_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchSuccess) {
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
        } else if (state is SearchError) {
          return Text(state.errMsg);
        }
        return const CustomListIndicator();
      },
    );
  }
}
