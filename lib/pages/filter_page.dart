import 'package:flutter/material.dart';
import 'package:meals_app/views/filter_view.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filter"),),
      body: const FiltersView(),
    );
  }
}
