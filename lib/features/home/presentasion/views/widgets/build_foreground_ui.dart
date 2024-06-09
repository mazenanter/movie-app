import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentasion/manager/request_value_cubit/request_value_cubit.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_list_view_item.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/custom_search_bar.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/up_coming_list_view.dart';

class BuildForegroundUi extends StatelessWidget {
  const BuildForegroundUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocConsumer<RequestValueCubit, RequestValueState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding:
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.02),
          width: MediaQuery.sizeOf(context).width * 0.90,
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              const CustomSearchBar(),
              if (state is RequestValueUpComingSuccessState)
                UpComingListView(height: height, width: width),
              if (state is RequestValuePopularSuccessState ||
                  state is RequestValueInitial)
                PopularListViewItem(height: height, width: width),
            ],
          ),
        );
      },
    );
  }
}
