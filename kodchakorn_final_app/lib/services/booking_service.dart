import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kodchakorn_final_app/models/booking_model.dart';

class BookingService {
  Future<List<Booking>> fetchBooking(String fetchBy, String userId) async {
    print("fetchAppointments=> fetchBy:${fetchBy} userId:${userId}");
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('kodchakorn_schedule')
          .where(fetchBy, isEqualTo: userId)
          .get();

      print("Booking is firebase count:${snapshot.docs.length}");

      return snapshot.docs.map((doc) => Booking.fromSnapshot(doc)).toList();
    } catch (e) {
      print("Error fetching appointments: $e");
      throw e; // rethrow the error for the controller to handle
    }
  }

  Future<Booking> addBooking(Map<String, dynamic> newBooking) async {
    print('addbboking is called');
    print(newBooking);
    try {
      DocumentReference ref = await FirebaseFirestore.instance
          .collection('kodchakorn_schedule')
          .add(newBooking);

      // Fetch the newly added document
      DocumentSnapshot newDoc = await ref.get();
      return Booking.fromSnapshot(newDoc);
    } catch (e, d) {
      print("Error adding appointment: $e");
      print(d);
      throw e; // rethrow the error for the controller to handle
    }
  }

  Future<void> deleteBooking(String bookingId) async {
    try {
      await FirebaseFirestore.instance
          .collection('kodchakorn_schedule')
          .doc(bookingId)
          .delete();
    } catch (e) {
      print("Error deleting appointment: $e");
      throw e; // rethrow the error for the controller to handle
    }
  }
}
