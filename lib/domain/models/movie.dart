class Movie {
  String id;
  String displayName;
  String imageUrl;
  double rating;
  int metascore;
  int year;
  String description;
  List<String> genres;
  MovieDetails details;

  Movie(
      {this.id,
      this.displayName,
      this.imageUrl,
      this.metascore,
      this.year,
      this.rating,
      this.description,
      this.genres,
      this.details});
}

class MovieDetails {
  int runtime;
  String tagline;
  String synopsis;
  DateTime releaseDate;
  String landingImageUrl;

  MovieDetails(
      {this.runtime,
      this.tagline,
      this.synopsis,
      this.releaseDate,
      this.landingImageUrl});
}
