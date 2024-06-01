import 'package:flutter/material.dart';
import 'package:hotstar/models/moviecp.dart';
import 'dart:async';

class SearchResultsScreen extends StatefulWidget {
  final String query;
  final List<MovieCopy> searchResults;

  const SearchResultsScreen({
    super.key,
    required this.query,
    required this.searchResults,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      
      print('Searching for: ${_searchController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration:const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.searchResults.length,
        itemBuilder: (context, index) {
          final MovieCopy movie = widget.searchResults[index];
          return ListTile(
            title: Text(movie.title.toString()),
          );
        },
      ),
    );
  }
}
