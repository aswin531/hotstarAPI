// // // // import 'dart:async';

// // // // Future<Response> retryRequestWithExponentialBackoff(
// // // //     Future<Response> Function() request,
// // // //     {int maxAttempts = 3}) async {
// // // //   const initialDelay = Duration(seconds: 1);
// // // //   var attempt = 0;
// // // //   while (attempt < maxAttempts) {
// // // //     try {
// // // //       return await request();
// // // //     } catch (e) {
// // // //       print('Attempt ${attempt + 1} failed: $e');
// // // //       attempt++;
// // // //       if (attempt < maxAttempts) {
// // // //         final delay = initialDelay * (1 << attempt); // Exponential backoff
// // // //         await Future.delayed(delay);
// // // //       }
// // // //     }
// // // //   }
// // // //   throw Exception('Max retry attempts reached');
// // // // }

// // // // // Example usage:
// // // // void fetchData() async {
// // // //   try {
// // // //     final response = await retryRequestWithExponentialBackoff(() async {
// // // //       // Make API request here
// // // //       return http.get('https://api.example.com/data');
// // // //     });
// // // //     // Process response
// // // //     print('Response: ${response.body}');
// // // //   } catch (e) {
// // // //     // Handle error
// // // //     print('Error: $e');
// // // //   }
// // // // }




// // // //APi

// // // // ignore_for_file: avoid_print
// // // import 'dart:convert';
// // // import 'package:hotstar/api/apiconstants.dart';
// // // import 'package:hotstar/api/exceptions.dart';
// // // import 'package:hotstar/models/movies.dart';
// // // import 'package:http/http.dart' as http;

// // // class Api {
// // //   // final apiDetails = ApiDetails();
// // //   final upComingApiUrl =
// // //       "https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiDetails.apiKey}";
// // //   final popularApiUrl =
// // //       "https://api.themoviedb.org/3/movie/popular?api_key=${ApiDetails.apiKey}";
// // //   final topRatedApiUrl =
// // //       "https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiDetails.apiKey}";
// // //   final topTvRatedApiUrl =
// // //       "https://api.themoviedb.org/3/tv/top_rated?api_key=${ApiDetails.apiKey}";

// // //   Future<List<Movie>> getUpComingMovies() async {
// // //     final response = await http.get(Uri.parse(upComingApiUrl));
// // //     if (response.statusCode == 200) {
// // //       final List<dynamic> data = json.decode(response.body)['results'];
// // //       List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
// // //       return movies;
// // //     } else {
// // //       throw Exception("Failed to load Upcoming Movies");
// // //     }
// // //   }

// // //   Future<List<Movie>> getPopularMovies() async {
// // //     try {
// // //       final response = await http.get(Uri.parse(popularApiUrl));

// // //       if (response.statusCode == 200) {
// // //         final List<dynamic> data = json.decode(response.body)['results'];
// // //         List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
// // //         return movies;
// // //       } else {
// // //         String errorMessage = '';
// // //         if (response.body.isNotEmpty) {
// // //           errorMessage = json.decode(response.body)['status_message'];
// // //         }

// // //         switch (response.statusCode) {
// // //           case 400:
// // //             throw BadRequestException(
// // //                 errorMessage.isNotEmpty ? errorMessage : "Bad request");
// // //           case 401:
// // //             throw UnauthorizedException(
// // //                 errorMessage.isNotEmpty ? errorMessage : "Unauthorized");
// // //           case 403:
// // //             throw ForbiddenException(
// // //                 errorMessage.isNotEmpty ? errorMessage : "Forbidden");
// // //           case 404:
// // //             throw NotFoundException(
// // //                 errorMessage.isNotEmpty ? errorMessage : "Not found");
// // //           case 500:
// // //             throw InternalServerErrorException(errorMessage.isNotEmpty
// // //                 ? errorMessage
// // //                 : "Internal server error");
// // //           default:
// // //             throw Exception(
// // //                 "Failed to load Popular Movies. Status code: ${response.statusCode}");
// // //         }
// // //       }
// // //     }  catch (e) {
// // //       print('Exception occurred: $e');
// // //       // ScaffoldMessenger.of().showSnackBar(SnackBar(
// // //       //   content: Text('Error: $e'),
// // //       // ));
// // //       // Rethrow the exception to propagate it further
// // //       rethrow;
// // //     }
// // //   }

// // //   Future<List<Movie>> gettopRatedMovies() async {
// // //     final response = await http.get(Uri.parse(topRatedApiUrl));
// // //     if (response.statusCode == 200) {
// // //       final List<dynamic> data = json.decode(response.body)['results'];
// // //       List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
// // //       return movies;
// // //     } else {
// // //       throw Exception("Failed to load Upcoming Movies");
// // //     }
// // //   }

// // //   Future<List<Movie>> gettopTvRatedMovies() async {
// // //     final response = await http.get(Uri.parse(topTvRatedApiUrl));
// // //     if (response.statusCode == 200) {
// // //       final List<dynamic> data = json.decode(response.body)['results'];
// // //       List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
// // //       return movies;
// // //     } else {
// // //       throw Exception("Failed to load Upcoming Movies");
// // //     }
// // //   }
// // // }



// // //CONTENT SCREEN

// // // ignore_for_file: avoid_print

// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/material.dart';
// // import 'package:hotstar/api/api.dart';
// // import 'package:hotstar/models/movies.dart';
// // import 'package:hotstar/screens/details/detailedscreen.dart';
// // import 'package:hotstar/screens/home/widgets/content.dart';
// // import 'package:hotstar/utils/colors.dart';

// // class HomeContentScreen extends StatefulWidget {
// //   const HomeContentScreen({super.key});

// //   @override
// //   State<HomeContentScreen> createState() => _HomeContentScreenState();
// // }

// // class _HomeContentScreenState extends State<HomeContentScreen> {
// //   late Future<List<Movie>> popularMovies;
// //   late Future<List<Movie>> upcomingMovies;
// //   // late Future<List<Movie>> asianetTvRatedMovies;
// //   late Future<List<Movie>> topRatedMovies;
// //   late Future<List<Movie>> topTvRatedMovies;
// //   @override
// //   void initState() {
// //     super.initState();
// //     loadMovies();
// //   }

// //   Future<void> loadMovies() async {
// //     popularMovies = Api().getPopularMovies();
// //     upcomingMovies = Api().getUpcomingMovies();
// //     topRatedMovies = Api().getTopRatedMovies();
// //     topTvRatedMovies = Api().gettopTvRatedMovies();
// //   }

// //   void _navigateToDetailedScreen(BuildContext context, Movie movie) {
// //     Navigator.of(context).push(MaterialPageRoute(
// //       builder: (context) => DetailedScreen(movie: movie),
// //     ));
// //   }

// //   Widget _buildContentSection(
// //     BuildContext context,
// //     String title,
// //     List<Movie> movies,
// //     double itemHeight,
// //     double itemWidth,
// //   ) {
// //     return ContentSection(
// //       title: title,
// //       itemHeight: itemHeight,
// //       itemBuilder: (context, index) {
// //         final Movie movie = movies[index];
// //         return Padding(
// //           padding: const EdgeInsets.all(2.0),
// //           child: GestureDetector(
// //             onTap: () => _navigateToDetailedScreen(context, movie),
// //             child: ClipRRect(
// //               borderRadius: BorderRadius.circular(8),
// //               child: Container(
// //                 width: itemWidth,
// //                 height: itemHeight,
// //                 color: color3,
// //                 child: CachedNetworkImage(
// //                   imageUrl: "",
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder(
// //       future: Future.wait([
// //         loadPopularMovies(),
// //         loadUpcomingMovies(),
// //         loadTopRatedMovies(),
// //         loadTopTvRatedMovies(),
// //       ]),
// //       builder: (context, AsyncSnapshot<List<List<Movie>>> snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Center(child: CircularProgressIndicator());
// //         } else if (snapshot.hasError) {
// //           return Center(child: Text('Error: ${snapshot.error}'));
// //         } else {
// //           final popularMovies = snapshot.data![0];
// //           final upcomingMovies = snapshot.data![1];
// //           final topRatedMovies = snapshot.data![2];
// //           final topTvRatedMovies = snapshot.data![3];

// //           final popularMoviesItemHeight =
// //               MediaQuery.of(context).size.height * 0.15;
// //           final popularMoviesItemWidth =
// //               MediaQuery.of(context).size.width * 0.45;

// //           final upcomingMoviesItemHeight =
// //               MediaQuery.of(context).size.height * 0.22;
// //           final upcomingMoviesItemWidth =
// //               MediaQuery.of(context).size.width * 0.297;

// //           final extraMoviesItemHeight =
// //               MediaQuery.of(context).size.height * 0.22;
// //           final extraMoviesItemWidth =
// //               MediaQuery.of(context).size.width * 0.297;

// //           final topRatedMoviesItemHeight =
// //               MediaQuery.of(context).size.height * 0.32;
// //           final topRatedMoviesItemWidth =
// //               MediaQuery.of(context).size.width * 0.45;

// //           final topTvRatedMoviesItemHeight =
// //               MediaQuery.of(context).size.height * 0.22;
// //           final topTvRatedMoviesItemWidth =
// //               MediaQuery.of(context).size.width * 0.297;

// //           return SingleChildScrollView(
// //             child: Padding(
// //               padding: const EdgeInsets.all(10.0),
// //               child: Column(
// //                 children: [
// //                   if (popularMovies.isNotEmpty)
// //                     _buildContentSection(
// //                       context,
// //                       "Best in Shows",
// //                       popularMovies,
// //                       popularMoviesItemHeight,
// //                       popularMoviesItemWidth,
// //                     ),
// //                   if (upcomingMovies.isNotEmpty)
// //                     _buildContentSection(
// //                       context,
// //                       "Latest Releases",
// //                       upcomingMovies,
// //                       upcomingMoviesItemHeight,
// //                       upcomingMoviesItemWidth,
// //                     ),
// //                   if (upcomingMovies.isNotEmpty)
// //                     _buildContentSection(
// //                       context,
// //                       "Asianet Shows",
// //                       topTvRatedMovies,
// //                       extraMoviesItemHeight,
// //                       extraMoviesItemWidth,
// //                     ),
// //                   if (topRatedMovies.isNotEmpty)
// //                     if (topRatedMovies.isNotEmpty)
// //                       _buildContentSection(
// //                         context,
// //                         "Hotstar Specials",
// //                         topRatedMovies,
// //                         topRatedMoviesItemHeight,
// //                         topRatedMoviesItemWidth,
// //                       ),
// //                   if (topTvRatedMovies.isNotEmpty)
// //                     _buildContentSection(
// //                       context,
// //                       "Popular Shows",
// //                       topTvRatedMovies,
// //                       topTvRatedMoviesItemHeight,
// //                       topTvRatedMoviesItemWidth,
// //                     ),
// //                 ],
// //               ),
// //             ),
// //           );
// //         }
// //       },
// //     );
// //   }

// //   Future<List<Movie>> loadPopularMovies() async {
// //     final api = Api();
// //     return await api.getPopularMovies();
// //   }

// //   Future<List<Movie>> loadUpcomingMovies() async {
// //     final api = Api();
// //     return await api.getUpcomingMovies();
// //   }

// //   Future<List<Movie>> loadTopRatedMovies() async {
// //     final api = Api();
// //     return await api.getTopRatedMovies();
// //   }

// //   Future<List<Movie>> loadTopTvRatedMovies() async {
// //     final api = Api();
// //     return await api.gettopTvRatedMovies();
// //   }
// // }




// //https://api.themoviedb.org/3/movie/now_playing

// //{
//   "dates": {
//     "maximum": "2024-04-10",
//     "minimum": "2024-02-28"
//   },
//   "page": 1,
//   "results": [
//     {
//       "adult": false,
//       "backdrop_path": "/sR0SpCrXamlIkYMdfz83sFn5JS6.jpg",
//       "genre_ids": [
//         28,
//         878,
//         12
//       ],
//       "id": 823464,
//       "original_language": "en",
//       "original_title": "Godzilla x Kong: The New Empire",
//       "overview": "Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.",
//       "popularity": 3404.57,
//       "poster_path": "/4Hbf0Gw5PD2GC7PmiwjEwf0ROCU.jpg",
//       "release_date": "2024-03-27",
//       "title": "Godzilla x Kong: The New Empire",
//       "video": false,
//       "vote_average": 6.71,
//       "vote_count": 431
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
//       "genre_ids": [
//         28,
//         12,
//         16,
//         35,
//         10751
//       ],
//       "id": 1011985,
//       "original_language": "en",
//       "original_title": "Kung Fu Panda 4",
//       "overview": "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
//       "popularity": 2101.694,
//       "poster_path": "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
//       "release_date": "2024-03-02",
//       "title": "Kung Fu Panda 4",
//       "video": false,
//       "vote_average": 6.752,
//       "vote_count": 604
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/oe7mWkvYhK4PLRNAVSvonzyUXNy.jpg",
//       "genre_ids": [
//         28,
//         53
//       ],
//       "id": 359410,
//       "original_language": "en",
//       "original_title": "Road House",
//       "overview": "Ex-UFC fighter Dalton takes a job as a bouncer at a Florida Keys roadhouse, only to discover that this paradise is not all it seems.",
//       "popularity": 1808.763,
//       "poster_path": "/bXi6IQiQDHD00JFio5ZSZOeRSBh.jpg",
//       "release_date": "2024-03-08",
//       "title": "Road House",
//       "video": false,
//       "vote_average": 7.134,
//       "vote_count": 1202
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/pwGmXVKUgKN13psUjlhC9zBcq1o.jpg",
//       "genre_ids": [
//         28,
//         14
//       ],
//       "id": 634492,
//       "original_language": "en",
//       "original_title": "Madame Web",
//       "overview": "Forced to confront revelations about her past, paramedic Cassandra Webb forges a relationship with three young women destined for powerful futures...if they can all survive a deadly present.",
//       "popularity": 1146.356,
//       "poster_path": "/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg",
//       "release_date": "2024-02-14",
//       "title": "Madame Web",
//       "video": false,
//       "vote_average": 5.7,
//       "vote_count": 974
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/2KGxQFV9Wp1MshPBf8BuqWUgVAz.jpg",
//       "genre_ids": [
//         16,
//         28,
//         12,
//         35,
//         10751
//       ],
//       "id": 940551,
//       "original_language": "en",
//       "original_title": "Migration",
//       "overview": "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
//       "popularity": 875.175,
//       "poster_path": "/ldfCF9RhR40mppkzmftxapaHeTo.jpg",
//       "release_date": "2023-12-06",
//       "title": "Migration",
//       "video": false,
//       "vote_average": 7.534,
//       "vote_count": 1080
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/deLWkOLZmBNkm8p16igfapQyqeq.jpg",
//       "genre_ids": [
//         14,
//         28,
//         12
//       ],
//       "id": 763215,
//       "original_language": "en",
//       "original_title": "Damsel",
//       "overview": "A young woman's marriage to a charming prince turns into a fierce fight for survival when she's offered up as a sacrifice to a fire-breathing dragon.",
//       "popularity": 851.212,
//       "poster_path": "/AgHbB9DCE9aE57zkHjSmseszh6e.jpg",
//       "release_date": "2024-03-07",
//       "title": "Damsel",
//       "video": false,
//       "vote_average": 7.141,
//       "vote_count": 1445
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
//       "genre_ids": [
//         878,
//         12
//       ],
//       "id": 693134,
//       "original_language": "en",
//       "original_title": "Dune: Part Two",
//       "overview": "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
//       "popularity": 704.576,
//       "poster_path": "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
//       "release_date": "2024-02-27",
//       "title": "Dune: Part Two",
//       "video": false,
//       "vote_average": 8.359,
//       "vote_count": 2424
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/4woSOUD0equAYzvwhWBHIJDCM88.jpg",
//       "genre_ids": [
//         28,
//         27,
//         53
//       ],
//       "id": 1096197,
//       "original_language": "en",
//       "original_title": "No Way Up",
//       "overview": "Characters from different backgrounds are thrown together when the plane they're travelling on crashes into the Pacific Ocean. A nightmare fight for survival ensues with the air supply running out and dangers creeping in from all sides.",
//       "popularity": 580.398,
//       "poster_path": "/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg",
//       "release_date": "2024-01-18",
//       "title": "No Way Up",
//       "video": false,
//       "vote_average": 6.285,
//       "vote_count": 331
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/jBPG5F5WW2qv5diBzxUr52sPMef.jpg",
//       "genre_ids": [
//         28,
//         53
//       ],
//       "id": 984324,
//       "original_language": "fr",
//       "original_title": "Le salaire de la peur",
//       "overview": "When an explosion at an oil well threatens hundreds of lives, a crack team is called upon to make a deadly desert crossing with nitroglycerine in tow.",
//       "popularity": 530.764,
//       "poster_path": "/jFK2ZLQUzo9pea0jfMCHDfvWsx7.jpg",
//       "release_date": "2024-03-28",
//       "title": "The Wages of Fear",
//       "video": false,
//       "vote_average": 5.832,
//       "vote_count": 91
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/qSc5JzPvSm6KxVv54nrn7SNXFtk.jpg",
//       "genre_ids": [
//         16,
//         10402,
//         35
//       ],
//       "id": 1192209,
//       "original_language": "pt",
//       "original_title": "Arca de Noé",
//       "overview": "A pair of mice attempt to board Noah's Ark: Vini, a charismatic poet with terrible stage fright, and Tito, a talented and charming guitarist. When the rains come, only one male and one female of each species is allowed on Noah's Ark. With the help of an ingenious cockroach and fate's good luck, Vini and Tito sneak their way onto the Ark and together avert a showdown among the ships carnivores and plant eaters. All the while, the animals perform a series of classic songs inspired by world renowned poet, Vinicius de Moraes. Can these talented stowaways use music to break the tension and help these cooped up creatures survive the 40 days and 40 nights together?",
//       "popularity": 448.99,
//       "poster_path": "/j1Rjw6a62UwrbTNT0I3JzZnnCmr.jpg",
//       "release_date": "2024-01-05",
//       "title": "Noah's Ark",
//       "video": false,
//       "vote_average": 7.058,
//       "vote_count": 26
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/mIBG74mhGEJnBubhYLkCtvplcNr.jpg",
//       "genre_ids": [
//         27
//       ],
//       "id": 437342,
//       "original_language": "en",
//       "original_title": "The First Omen",
//       "overview": "When a young American woman is sent to Rome to begin a life of service to the church, she encounters a darkness that causes her to question her own faith and uncovers a terrifying conspiracy that hopes to bring about the birth of evil incarnate.",
//       "popularity": 476.842,
//       "poster_path": "/hil2ResSCwP95JweZVJsZ5CbZdc.jpg",
//       "release_date": "2024-04-03",
//       "title": "The First Omen",
//       "video": false,
//       "vote_average": 7.3,
//       "vote_count": 14
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/nb3xI8XI3w4pMVZ38VijbsyBqP4.jpg",
//       "genre_ids": [
//         18,
//         36
//       ],
//       "id": 872585,
//       "original_language": "en",
//       "original_title": "Oppenheimer",
//       "overview": "The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.",
//       "popularity": 443.134,
//       "poster_path": "/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
//       "release_date": "2023-07-19",
//       "title": "Oppenheimer",
//       "video": false,
//       "vote_average": 8.1,
//       "vote_count": 7529
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/oBIQDKcqNxKckjugtmzpIIOgoc4.jpg",
//       "genre_ids": [
//         28,
//         53,
//         10752
//       ],
//       "id": 969492,
//       "original_language": "en",
//       "original_title": "Land of Bad",
//       "overview": "When a Delta Force special ops mission goes terribly wrong, Air Force drone pilot Reaper has 48 hours to remedy what has devolved into a wild rescue operation. With no weapons and no communication other than the drone above, the ground mission suddenly becomes a full-scale battle when the team is discovered by the enemy.",
//       "popularity": 463.268,
//       "poster_path": "/h3jYanWMEJq6JJsCopy1h7cT2Hs.jpg",
//       "release_date": "2024-01-25",
//       "title": "Land of Bad",
//       "video": false,
//       "vote_average": 7.113,
//       "vote_count": 479
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/wUp0bUXaveR40ikBhDgWwNTijuD.jpg",
//       "genre_ids": [
//         28,
//         9648,
//         53
//       ],
//       "id": 1181548,
//       "original_language": "en",
//       "original_title": "Heart of the Hunter",
//       "overview": "A retired assassin is pulled back into action when his friend uncovers a dangerous conspiracy at the heart of the South African government.",
//       "popularity": 589.148,
//       "poster_path": "/n726fdyL1dGwt15bY7Nj3XOXc4Q.jpg",
//       "release_date": "2024-03-28",
//       "title": "Heart of the Hunter",
//       "video": false,
//       "vote_average": 5.827,
//       "vote_count": 26
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/3Kzc6V4MWs3RXCmE5DhAYnfWL8F.jpg",
//       "genre_ids": [
//         16,
//         35,
//         878
//       ],
//       "id": 1239251,
//       "original_language": "en",
//       "original_title": "Megamind vs. the Doom Syndicate",
//       "overview": "Megamind's former villain team, The Doom Syndicate, has returned. Our newly crowned blue hero must now keep up evil appearances until he can assemble his friends (Roxanne, Ol' Chum and Keiko) to stop his former evil teammates from launching Metro City to the Moon.",
//       "popularity": 418.379,
//       "poster_path": "/fko8CPrnspewLXgFUlUkivyvpHX.jpg",
//       "release_date": "2024-03-29",
//       "title": "Megamind vs. the Doom Syndicate",
//       "video": false,
//       "vote_average": 5.7,
//       "vote_count": 32
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/fS89P93Lq6pyT7d8ox8AMAEtXUs.jpg",
//       "genre_ids": [
//         878,
//         10749,
//         35
//       ],
//       "id": 792307,
//       "original_language": "en",
//       "original_title": "Poor Things",
//       "overview": "Brought back to life by an unorthodox scientist, a young woman runs off with a debauched lawyer on a whirlwind adventure across the continents. Free from the prejudices of her times, she grows steadfast in her purpose to stand for equality and liberation.",
//       "popularity": 398.111,
//       "poster_path": "/kCGlIMHnOm8JPXq3rXM6c5wMxcT.jpg",
//       "release_date": "2023-12-07",
//       "title": "Poor Things",
//       "video": false,
//       "vote_average": 7.811,
//       "vote_count": 2960
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/ehumsuIBbgAe1hg343oszCLrAfI.jpg",
//       "genre_ids": [
//         16,
//         10751,
//         14,
//         12
//       ],
//       "id": 1022796,
//       "original_language": "en",
//       "original_title": "Wish",
//       "overview": "Asha, a sharp-witted idealist, makes a wish so powerful that it is answered by a cosmic force – a little ball of boundless energy called Star. Together, Asha and Star confront a most formidable foe - the ruler of Rosas, King Magnifico - to save her community and prove that when the will of one courageous human connects with the magic of the stars, wondrous things can happen.",
//       "popularity": 392.36,
//       "poster_path": "/vgJZSqKMXWDDx09iSIStGKfHMku.jpg",
//       "release_date": "2023-11-13",
//       "title": "Wish",
//       "video": false,
//       "vote_average": 6.594,
//       "vote_count": 953
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/lzWHmYdfeFiMIY4JaMmtR7GEli3.jpg",
//       "genre_ids": [
//         878,
//         12
//       ],
//       "id": 438631,
//       "original_language": "en",
//       "original_title": "Dune",
//       "overview": "Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.",
//       "popularity": 357.587,
//       "poster_path": "/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
//       "release_date": "2021-09-15",
//       "title": "Dune",
//       "video": false,
//       "vote_average": 7.79,
//       "vote_count": 11094
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/nTPFkLUARmo1bYHfkfdNpRKgEOs.jpg",
//       "genre_ids": [
//         10749,
//         35
//       ],
//       "id": 1072790,
//       "original_language": "en",
//       "original_title": "Anyone But You",
//       "overview": "After an amazing first date, Bea and Ben’s fiery attraction turns ice cold — until they find themselves unexpectedly reunited at a destination wedding in Australia. So they do what any two mature adults would do: pretend to be a couple.",
//       "popularity": 344.759,
//       "poster_path": "/5qHoazZiaLe7oFBok7XlUhg96f2.jpg",
//       "release_date": "2023-12-21",
//       "title": "Anyone But You",
//       "video": false,
//       "vote_average": 7.1,
//       "vote_count": 1250
//     },
//     {
//       "adult": false,
//       "backdrop_path": "/xvk5AhfhgQcTuaCQyq3XqAnhEma.jpg",
//       "genre_ids": [
//         28,
//         12,
//         35
//       ],
//       "id": 848538,
//       "original_language": "en",
//       "original_title": "Argylle",
//       "overview": "When the plots of reclusive author Elly Conway's fictional espionage novels begin to mirror the covert actions of a real-life spy organization, quiet evenings at home become a thing of the past. Accompanied by her cat Alfie and Aiden, a cat-allergic spy, Elly races across the world to stay one step ahead of the killers as the line between Conway's fictional world and her real one begins to blur.",
//       "popularity": 342.778,
//       "poster_path": "/siduVKgOnABO4WH4lOwPQwaGwJp.jpg",
//       "release_date": "2024-01-31",
//       "title": "Argylle",
//       "video": false,
//       "vote_average": 6.2,
//       "vote_count": 786
//     }
//   ],
//   "total_pages": 207,
//   "total_results": 4128
// }