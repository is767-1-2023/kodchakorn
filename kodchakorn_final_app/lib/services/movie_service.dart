import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kodchakorn_final_app/models/movies_model.dart';

class MovieService {
  Future<List<Movie>> fetchMovies() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('kodchakorn_movies')
          .get();

      print("Movies in firebase count:${snapshot.docs.length}");

      return snapshot.docs.map((doc) => Movie.fromSnapshot(doc)).toList();
    } catch (e) {
      print("Error fetching movies: $e");
      throw e; // rethrow the error for the controller to handle
    }
  }

  Future<Movie> addMovie(Map<String, dynamic> newMovieData) async {
    try {
      DocumentReference ref = await FirebaseFirestore.instance
          .collection('kodchakorn_movies')
          .add(newMovieData);

      // Fetch the newly added document
      DocumentSnapshot newDoc = await ref.get();
      return Movie.fromSnapshot(newDoc);
    } catch (e) {
      print("Error adding movie: $e");
      throw e; // rethrow the error for the controller to handle
    }
  }

  Future<Movie> updateMovie(
      String movieId, Map<String, dynamic> updatedMovieData) async {
    try {
      DocumentReference movieRef = FirebaseFirestore.instance
          .collection('kodchakorn_movies')
          .doc(movieId);

      // Update the document
      await movieRef.update(updatedMovieData);

      // Fetch the updated document
      DocumentSnapshot updatedDoc = await movieRef.get();
      return Movie.fromSnapshot(updatedDoc);
    } catch (e) {
      print("Error updating movie: $e");
      throw e;
    }
  }
}
