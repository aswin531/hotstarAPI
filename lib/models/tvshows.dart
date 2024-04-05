class TvShows {
  String? title;
  String? backDropPath;
  String? overView;
  String? posterPath;

  TvShows({
    required this.title,
    required this.backDropPath,
    required this.overView,
    required this.posterPath,
  });

  factory TvShows.fromMap(Map<String, dynamic> map) {
    return TvShows(
      title: map['title'],
      backDropPath: map['backdrop_path'],
      overView: map['overview'],
      posterPath: map['poster_path'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backDropPath': backDropPath,
      'overView': overView,
      'posterPath': posterPath
    };
  }
}
