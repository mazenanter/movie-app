import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentasion/manager/search_cubit/search_cubit.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_background_image_filter.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/default_search_text_field.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/search_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            const CustomBackgroundImageFilter(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFieldSearchView(
                    onChanged: (value) {
                      BlocProvider.of<SearchCubit>(context).searchMovies(
                        query: value,
                      );
                    },
                  ),
                  if (state is SearchSuccess) const SearchListView(),
                  if (state is SearchLoading)
                    const Center(child: LinearProgressIndicator()),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomTextFieldSearchView extends StatelessWidget {
  const CustomTextFieldSearchView({
    super.key,
    this.onChanged,
  });
  final dynamic Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.08,
          width: MediaQuery.sizeOf(context).width * 0.89,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  DefaultSearchTextField(
                    onChanged: onChanged,
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
