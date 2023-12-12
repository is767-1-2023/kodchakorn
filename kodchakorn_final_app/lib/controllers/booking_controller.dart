import 'dart:async';

import 'package:kodchakorn_final_app/models/booking_model.dart';
import 'package:kodchakorn_final_app/services/booking_service.dart';

class BoookingController {
  final BookingService _appointmentService = BookingService();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  Future<List<Booking>> fetchBooking(String fetchBy, String userId) async {
    print('fetchBooking is called');
    onSyncController.add(true);
    try {
      List<Booking> bookings =
          await _appointmentService.fetchBooking(fetchBy, userId);
      print(bookings);
      onSyncController.add(false);
      return bookings;
    } catch (e) {
      onSyncController.add(false);
      throw e;
    }
  }

  Future<Booking?> addBooking(Map<String, dynamic> newBooking) async {
    print('addAppointment is called');
    onSyncController.add(true);
    try {
      // Logic to add an appointment in the database
      Booking addedBooking = await _appointmentService.addBooking(newBooking);
      print(addedBooking);
      onSyncController.add(false);
      return addedBooking;
    } catch (e, d) {
      print(d);
      print("Error adding appointmentcontoller: $e");

      onSyncController.add(false);
      return null; // return null or handle the error as needed
    }
  }
}
