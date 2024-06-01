import 'package:flutter/material.dart';
import 'package:hotstar/api/apicopy.dart';
import 'package:hotstar/models/moviecp.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/screens/home/widgets/content.dart';

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SuggestionsScreenState createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  late Future<List<MovieCopy>> _nowPlayingMovies;

  @override
  void initState() {
    super.initState();
    _nowPlayingMovies = ApiCopy().getnowPLaying();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieCopy>>(
      future: _nowPlayingMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ContentSection(
                  title: "Related Shows",
                  itemHeight: MediaQuery.of(context).size.height * 0.22,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.31,
                          // height: MediaQuery.of(context).size.height * 0.80,
                          color: primary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                movie.title ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              movie.posterPath != null
                                  ? Image.network(
                                      'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                                      height: 100,
                                    )
                                  : Container(),
                              const SizedBox(height: 8),
                              Text(
                                movie.overView ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white, 
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                ),
                ContentSection(
                  title: "Related Shows",
                  itemHeight: MediaQuery.of(context).size.height * 0.22,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.31,
                          // height: MediaQuery.of(context).size.height * 0.80,
                          color: primary, 
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                movie.title ?? '',
                                style: const TextStyle(
                                  color: Colors.white, 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              movie.posterPath != null
                                  ? Image.network(
                                      'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                                      height: 100,
                                    )
                                  : Container(),
                              const SizedBox(height: 8),
                              Text(
                                movie.overView ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
