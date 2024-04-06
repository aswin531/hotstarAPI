class Movie {
  String? title;
  String? backdropPath;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  String? trailerUrl;
  String? categorySpecificField;

  Movie({
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    this.releaseDate,
    this.trailerUrl,
    this.categorySpecificField,
  });

  factory Movie.fromMap(Map<String, dynamic> map, String category) {
    switch (category) {
      case 'latest':
        return Movie(
          title: map['title'],
          backdropPath: map['backdrop_path'],
          overview: map['overview'],
          posterPath: map['poster_path'],
          releaseDate: DateTime.tryParse(map['release_date'] ?? ''),
          trailerUrl: map['trailer_url'],
          categorySpecificField: map['latest_specific_field'], 
        );
      case 'upcoming':
        return Movie(
          title: map['title'],
          backdropPath: map['backdrop_path'],
          overview: map['overview'],
          posterPath: map['poster_path'],
          releaseDate: DateTime.tryParse(map['release_date'] ?? ''),
          trailerUrl: map['trailer_url'],
          categorySpecificField: map['upcoming_specific_field'], 
        );
      default:
        throw ArgumentError('Invalid category: $category');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backdropPath': backdropPath,
      'overview': overview,
      'posterPath': posterPath,
      'releaseDate': releaseDate?.toString(),
      'trailerUrl': trailerUrl,
      'categorySpecificField': categorySpecificField,
    };
  }
}
