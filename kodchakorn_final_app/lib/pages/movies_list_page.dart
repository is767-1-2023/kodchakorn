import 'package:flutter/material.dart';
import 'package:kodchakorn_final_app/controllers/movie_controller.dart';
import 'package:kodchakorn_final_app/models/movies_model.dart';
import 'package:kodchakorn_final_app/pages/movies_add_page.dart';
import 'package:kodchakorn_final_app/pages/movies_detail_page.dart';
import 'package:provider/provider.dart';

class MoviesListPage extends StatefulWidget {
  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  bool isLoading = false;
  MovieController _movieController = MovieController();

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  void _getMovies() async {
    setState(() {
      isLoading = true;
    });

    List<Movie> newMovieData = await _movieController.fetchMovies();

    setState(() {
      isLoading = false;
      context.read<MoviesProvider>().setMovies(newMovieData);
      print('setMovie is called');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('Doo-Nung'),
        actions: [
          IconButton(
            icon: Icon(Icons.add), // Replace with your preferred icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BookingPage(), // Replace with the page you want to navigate to
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<MoviesProvider>(
              builder: (context, moviesProvider, _) {
                List<Movie>? movies = moviesProvider.allMovies;
                return ListView.builder(
                  itemCount: movies?.length ?? 0,
                  itemBuilder: (context, index) {
                    final movie = movies?[index];
                    if (movie == null) return Container();

                    return Card(
                      elevation: 4.0,
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MoviesDetailPage(movie: movie),
                            ),
                          );
                        },
                        leading: Image.network(
                          movie.imagePath,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
                        ),
                        title: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                            'Genre: ${movie.genre}\nLength: ${movie.length}\nSource: ${movie.source}'),
                        isThreeLine: true,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
