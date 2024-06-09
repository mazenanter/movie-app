import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentasion/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SearchViewBody(),
    );
  }
}
