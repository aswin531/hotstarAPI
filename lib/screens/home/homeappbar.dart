import 'package:flutter/material.dart';
import 'package:hotstar/api/api.dart';
import 'package:hotstar/models/movies.dart';
import 'package:hotstar/screens/home/homebody.dart';
import 'package:hotstar/screens/home/widgets/button.dart';
import 'package:hotstar/screens/home/widgets/homecarousel.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/icons.dart';
import 'package:hotstar/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> toptvratedmovies;
  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    popularMovies = Api().getPopularMovies();
    upcomingMovies = Api().getUpComingMovies();
    topratedMovies = Api().gettopRatedMovies();
    toptvratedmovies = Api().gettopTvRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: lightblack,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Movie>>(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return HomeScreenBody(movies: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              ButtonClass(
                buttonColor: addgrey,
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
              backgroundColor: Colors.transparent,
              leading: Image.asset(pIconBg),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
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
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   top: 150,
          //   child: ButtonClass(
          //     buttonColor: addgrey,
          //     buttonText: "Watch ",
          //     buttonText2: " Free",
          //     additionalColor: addColor,
          //     textColor: white,
          //   ),
          // )
        ],
      ),
    );
  }
}
