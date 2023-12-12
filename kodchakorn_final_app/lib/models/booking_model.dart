import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Booking {
  final String id;
  final DateTime scheduleTime;
  final String movieId;
  final DateTime timeStamp;

  Booking({
    required this.id,
    required this.scheduleTime,
    required this.movieId,
    required this.timeStamp,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      scheduleTime: json['scheduleTime'].toDate(),
      movieId: json['movieId'],
      timeStamp: json['timeStamp'].toDate(),
    );
  }

  factory Booking.fromSnapshot(DocumentSnapshot snapshot) {
    // print("Appointment.fromSnapshot:${snapshot.data()}");
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return Booking(
      id: snapshot.id,
      scheduleTime: (data['scheduleTime'] as Timestamp).toDate(),
      movieId: data['movieId'],
      timeStamp: (data['timeStamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'scheduleTime': scheduleTime,
      'movieId': movieId,
      'timeStamp': timeStamp,
    };
  }

  @override
  String toString() {
    return 'Booking{id: $id, scheduleTime: $scheduleTime, movieId: $movieId,timeStamp: $timeStamp }';
  }
}

class AllBookings {
  final List<Booking> bookings;

  AllBookings({required this.bookings});

  factory AllBookings.fromJson(List<dynamic> json) {
    return AllBookings(
      bookings: json.map((data) => Booking.fromJson(data)).toList(),
    );
  }
}

class BookingsProvider with ChangeNotifier {
  List<Booking> _bookings = [];

  Future<List<Booking>> getBookingsForMovie(String movieId) async {
    List<Booking> movieBookings = [];
    try {
      QuerySnapshot bookingsSnapshot = await FirebaseFirestore.instance
          .collection('kodchakorn_schedule')
          .where('movieId', isEqualTo: movieId)
          .get();

      movieBookings = bookingsSnapshot.docs
          .map((snapshot) => Booking.fromSnapshot(snapshot))
          .toList();
    } catch (e) {
      print("Error fetching bookings for movie: $e");
    }
    return movieBookings;
  }

  List<Booking> get bookings => _bookings;

  void setBookings(List<Booking> newBookings) {
    print("setBookings...${newBookings.length} items");
    _bookings = newBookings;
    notifyListeners();
  }

  void addBooking(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }

  void clearBooking() {
    _bookings = [];
    notifyListeners();
  }

  void deleteBooking(Booking booking) {
    _bookings.remove(booking);
    notifyListeners();
  }
}
