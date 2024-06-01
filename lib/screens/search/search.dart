import 'package:flutter/material.dart';
import 'package:hotstar/screens/search/widgets/searchbar.dart';
import 'package:hotstar/screens/search/widgets/searchbody.dart';
import 'package:hotstar/utils/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: bgcolor,
        elevation: 0,
      ),
      backgroundColor: lightblack,
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarWidget(),
              SizedBox(
                height: 20,
              ),
              SearchScreenBody(),
            ],
          ),
        ),
      ),
    );
  }
}
