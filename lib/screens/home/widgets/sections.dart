import 'package:hotstar/models/moviecp.dart';

class Section {
  final String title;
  final String apiUrl;
  final Future<List<MovieCopy>> Function() fetchData;

  const Section({
    required this.title,
    required this.apiUrl,
    required this.fetchData,
  });

}
