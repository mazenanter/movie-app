import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/features/home/data/data_sources/remote_data_source.dart';
import 'package:movie_app/features/home/data/repos/home_repo_impl.dart';
import 'package:movie_app/features/home/presentasion/manager/popular_cubit/popular_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentasion/manager/request_value_cubit/request_value_cubit.dart';
import 'package:movie_app/features/home/presentasion/manager/search_cubit/search_cubit.dart';
import 'package:movie_app/features/home/presentasion/manager/up_coming_cubit/upcoming_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PopularCubit(HomeRepoImpl(HomeRemoteDataSourceImpl(ApiService())))
                ..fetchPopularMovies(),
        ),
        BlocProvider(create: (context) => RequestValueCubit()),
        BlocProvider(
          create: (context) => UpcomingCubit(
              HomeRepoImpl(HomeRemoteDataSourceImpl(ApiService())))
            ..fetchUpComingMovies(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            HomeRepoImpl(
              HomeRemoteDataSourceImpl(
                ApiService(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
