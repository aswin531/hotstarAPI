import 'dart:async'; // Import async library for Timer
import 'package:flutter/material.dart';
import 'package:hotstar/utils/colors.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool isFocused = false;
  // ignore: prefer_final_fields
  TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      String searchTerm = _searchController.text;
      // ignore: avoid_print
      print('Searching for: $searchTerm');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFocused = !isFocused;
        });
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.96,
        height: MediaQuery.of(context).size.height * 0.045,
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            filled: true,
            fillColor: isFocused ? black : white,
            focusedBorder: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: black,
            ),
            suffixIcon: Icon(
              Icons.mic_none_sharp,
              color: black,
            ),
            hintText: "Movies, shows and more",
          ),
        ),
      ),
    );
  }
  
}

