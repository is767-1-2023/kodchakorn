import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Movie {
  String id;
  String genre;
  String imagePath;
  String length;
  String title;
  String source;

  Movie(this.id, this.genre, this.imagePath, this.length, this.title,
      this.source);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'] as String,
      json['genre'] as String,
      json['imagePath'] as String,
      json['length'] as String,
      json['title'] as String,
      json['source'] as String,
    );
  }

  factory Movie.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
    return Movie(
      snapshot.id,
      json['genre'] as String,
      json['imagePath'] as String,
      json['length'] as String,
      json['title'] as String,
      json['source'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'genre': genre,
      'imagePath': imagePath,
      'length': length,
      'title': title,
      'source': source,
    };
  }

  String toString() {
    return 'YourClassName{id: $id, genre: $genre, imagePath: $imagePath, length: $length, title: $title}';
  }
}

class AllMovies {
  final List<Movie> movies;

  AllMovies(this.movies);

  factory AllMovies.fromJson(List<dynamic> json) {
    List<Movie> movies = json.map((item) => Movie.fromJson(item)).toList();
    return AllMovies(movies);
  }

  factory AllMovies.fromSnapshot(QuerySnapshot qs) {
    List<Movie> movies = qs.docs.map((DocumentSnapshot ds) {
      Map<String, dynamic> dataWithId = ds.data() as Map<String, dynamic>;
      dataWithId['id'] = ds.id;
      return Movie.fromJson(dataWithId);
    }).toList();
    return AllMovies(movies);
  }

  Map<String, dynamic> toJson() {
    return {
      'movies': movies.map((movie) => movie.toJson()).toList(),
    };
  }
}

class MoviesProvider extends ChangeNotifier {
  List<Movie>? _allMovies = [];

  List<Movie>? get allMovies => _allMovies;

  void setMovies(List<Movie>? movies) {
    _allMovies = movies;
    notifyListeners();
  }

  void addMovie(Movie movie) {
    print("addMovie @ provider is called");
    _allMovies!.add(movie);
    notifyListeners();
  }

  void updateMovie(Movie updatedMovie) {
    print("updateMovie @ provider is called");
    int index = _allMovies!.indexWhere((movie) => movie.id == updatedMovie.id);
    if (index != -1) {
      _allMovies![index] = updatedMovie;
      notifyListeners();
    }
  }

  Movie? getMovieById(String id) {
    return _allMovies?.firstWhere(
      (movie) => movie.id == id,
    );
  }
}
