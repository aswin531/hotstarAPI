import 'package:hotstar/models/movies.dart';

class Section {
  final String title;
  final String apiUrl;
  final Future<List<Movie>> Function() fetchData;

  const Section({
    required this.title,
    required this.apiUrl,
    required this.fetchData,
  });

}
