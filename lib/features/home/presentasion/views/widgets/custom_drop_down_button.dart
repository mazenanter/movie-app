import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/category_model/category_model.dart';
import 'package:movie_app/features/home/presentasion/manager/popular_cubit/popular_cubit.dart';
import 'package:movie_app/features/home/presentasion/manager/request_value_cubit/request_value_cubit.dart';
import 'package:movie_app/features/home/presentasion/manager/up_coming_cubit/upcoming_cubit.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String selectetItem = 'popular';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const [
        DropdownMenuItem(
          value: CategoryModel.popular,
          child: Text(
            CategoryModel.popular,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DropdownMenuItem(
          value: CategoryModel.upComing,
          child: Text(
            CategoryModel.upComing,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
      onChanged: (value) {
        selectetItem = value!;
        setState(() {});
        BlocProvider.of<RequestValueCubit>(context)
            .changeValue(requestValue: value);
        if (value == 'upComing') {
          BlocProvider.of<UpcomingCubit>(context).fetchUpComingMovies();
        } else {
          BlocProvider.of<PopularCubit>(context).fetchPopularMovies();
        }
      },
      dropdownColor: Colors.black38,
      value: selectetItem,
      icon: const Icon(
        Icons.menu,
        color: Colors.white24,
      ),
    );
  }
}
