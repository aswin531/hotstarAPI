class HotstarSpecials {
  String? title;
  String? backDropPath;
  String? overView;
  String? posterPath;

  HotstarSpecials({
    required this.title,
    required this.backDropPath,
    required this.overView,
    required this.posterPath,
  });

  factory HotstarSpecials.fromMap(Map<String, dynamic> map) {
    return HotstarSpecials(
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
