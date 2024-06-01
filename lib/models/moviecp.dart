class MovieCopy {
  String? title;
  String? backDropPath;
  String? originalTitle;
  String? overView;
  String? posterPath;
  String? releaseDate;
  double vote;

  MovieCopy({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overView,
    required this.posterPath,
    required this.releaseDate,
    required this.vote,
  });

  factory MovieCopy.fromJson(Map<String, dynamic> json) {
    return MovieCopy(
        title: json["title"],
        backDropPath: json["backdrop_path"],
        originalTitle: json["original_name"],
        overView: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        vote: json["vote_average"].toDouble());
  }

  // Map<String, dynamic> toJson() =>{

  // }
}
