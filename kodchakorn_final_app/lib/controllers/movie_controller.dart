import 'dart:async';

import 'package:kodchakorn_final_app/models/movies_model.dart';
import 'package:kodchakorn_final_app/services/movie_service.dart';

class MovieController {
  final MovieService _movieService = MovieService();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  Future<List<Movie>> fetchMovies() async {
    print('fetchMovies is called');
    onSyncController.add(true);
    try {
      List<Movie> movies = await _movieService.fetchMovies();
      print(movies);
      onSyncController.add(false);
      return movies;
    } catch (e) {
      onSyncController.add(false);
      throw e;
    }
  }

  Future<Movie?> addMovie(Map<String, dynamic> newMovieData) async {
    print('addMovie is called');
    onSyncController.add(true);
    try {
      Movie addedMive = await _movieService.addMovie(newMovieData);
      print(addedMive);
      onSyncController.add(false);
      return addedMive;
    } catch (e) {
      print("Error adding movie: $e");
      onSyncController.add(false);
      return null;
    }
  }

  Future<Movie?> updateMovie(
      String movieId, Map<String, dynamic> updatedMovieData) async {
    print('updateMovie is called');
    onSyncController.add(true);
    try {
      Movie updatedMovie =
          await _movieService.updateMovie(movieId, updatedMovieData);
      print(updatedMovie);
      onSyncController.add(false);
      return updatedMovie;
    } catch (e) {
      print("Error updating movie: $e");
      onSyncController.add(false);
      return null;
    }
  }
}
