import 'package:flutter/material.dart';

class DefaultSearchTextField extends StatelessWidget {
  const DefaultSearchTextField({
    super.key,
    this.onChanged,
  });
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: TextFormField(
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
          ),
          filled: false,
          fillColor: Colors.white24,
          hintStyle: TextStyle(
            color: Colors.white54,
          ),
          hintText: 'Search....',
        ),
      ),
    );
  }
}
