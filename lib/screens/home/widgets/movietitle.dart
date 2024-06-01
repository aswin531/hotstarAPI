// import 'package:flutter/material.dart';
// import 'package:hotstar/api/api.dart';
// import 'package:hotstar/models/movies.dart';
// import 'package:hotstar/screens/home/homeappbar.dart';

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Movie>>(
//         future: Api().getnowPLaying(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else {
//             List<Movie>? movies = snapshot.data;
//             return ListView.builder(
//               itemCount: movies?.length ?? 0,
//               itemBuilder: (context, index) {
//                 String title = movies![index].title ?? 'Unknown Title';
//                 return ListTile(
//                   title: Text(title),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         // builder: (context) => HomeScreen(title: title),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
