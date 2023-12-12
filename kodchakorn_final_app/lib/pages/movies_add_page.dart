import 'package:flutter/material.dart';
import 'package:kodchakorn_final_app/models/booking_model.dart';
import 'package:kodchakorn_final_app/models/movies_model.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: Consumer<BookingsProvider>(
        builder: (context, bookingsProvider, _) {
          List<Booking> bookings = bookingsProvider.bookings;

          if (bookings.isEmpty) {
            return Center(
              child: Text('No bookings available'),
            );
          }

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              Booking booking = bookings[index];
              Movie? movie = Provider.of<MoviesProvider>(context, listen: false)
                  .getMovieById(booking.movieId);

              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: movie != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(movie.imagePath),
                          )
                        : CircleAvatar(), // Placeholder for image
                    title: Text(movie?.title ?? 'Movie Title Unavailable'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Schedule Time: ${booking.scheduleTime}'),
                        Text('Timestamp: ${booking.timeStamp}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Implement logic to delete booking on tap
                        // bookingsProvider.deleteBooking(booking);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
