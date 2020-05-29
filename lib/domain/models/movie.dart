class Movie {
  String id;
  String displayName;
  String imageUrl;
  double rating;
  int metascore;
  int runtime;
  int year;
  String description;
  List<String> genres;
  MovieDetails details;

  Movie(
      {this.id,
        this.runtime,
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
  String tagline;
  String synopsis;
  DateTime releaseDate;
  String landingImageUrl;

  MovieDetails({
      this.tagline,
      this.synopsis,
      this.releaseDate,
      this.landingImageUrl});
}
