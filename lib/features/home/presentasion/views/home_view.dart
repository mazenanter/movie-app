import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: HomeViewBody(),
    );
  }
}
