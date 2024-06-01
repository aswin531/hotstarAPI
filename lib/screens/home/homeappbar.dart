import 'package:flutter/material.dart';
import 'package:hotstar/api/apicopy.dart';
import 'package:hotstar/models/moviecp.dart';
import 'package:hotstar/screens/home/homebody.dart';
import 'package:hotstar/screens/home/widgets/button.dart';
import 'package:hotstar/screens/home/widgets/homecarousel.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/icons.dart';
import 'package:hotstar/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieCopy>> popularCopyMovie;
  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    popularCopyMovie = ApiCopy().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: lightblack,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FutureBuilder<List<MovieCopy>>(
                  future: popularCopyMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      // final data = snapshot.data;
                      return HomeScreenBody(snapshot: snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              ButtonClass(
                buttonColor: addgrey, //addgrey,
                buttonText: "Watch ",
                buttonText2: " Free",
                additionalColor: addColor,
                textColor: white,
              ),
              const Expanded(child: HomeContentScreen()),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              elevation: 0,
              backgroundColor: transparent,
              leading: Image.asset(pIconBg),
              actions: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.135,
                      height: MediaQuery.of(context).size.height * 0.018,
                      decoration: BoxDecoration(
                        color: transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(width: 1, color: transparentGold),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "SUBSCRIBE",
                          textAlign: TextAlign.center,
                          style: MyTextStyles.subtextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.cast, color: Colors.white),
                    const SizedBox(width: 15),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



  // late Future<List<Movie>>? popularMovies = fetchpopularMovies();
  // late Future<List<Movie>>? upcomingMovies = fetchupcomingMovies();
  // late Future<List<Movie>>? topratedMovies = fetchtopratedMovies();
  // late Future<List<Movie>>? toptvratedmovies = fetchtoptvratedmovies();
  // late Future<List<Movie>>? nowPlayingMovies = fetchNowPlayingMovies();

      // popularMovies = Api().getPopularMovies();
    // upcomingMovies = Api().getUpcomingMovies();
    // topratedMovies = Api().getTopRatedMovies();
    // toptvratedmovies = Api().gettopTvRatedMovies();
    // nowPlayingMovies = Api().getnowPLaying();

     // static Future<List<Movie>> fetchNowPlayingMovies() async {
  //   return Api().getnowPLaying();
  // }

  // static Future<List<Movie>> fetchupcomingMovies() async {
  //   return Api().getUpcomingMovies();
  // }

  // static Future<List<Movie>> fetchtopratedMovies() async {
  //   return Api().getTopRatedMovies();
  // }

  // static Future<List<Movie>> fetchtoptvratedmovies() async {
  //   return Api().gettopTvRatedMovies();
  // }