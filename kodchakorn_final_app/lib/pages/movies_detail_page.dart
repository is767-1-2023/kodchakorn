import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kodchakorn_final_app/controllers/booking_controller.dart';
import 'package:kodchakorn_final_app/models/booking_model.dart';
import 'package:kodchakorn_final_app/models/movies_model.dart';
import 'package:intl/intl.dart';
import 'package:kodchakorn_final_app/pages/movies_add_page.dart';
import 'package:provider/provider.dart';

class MoviesDetailPage extends StatefulWidget {
  final Movie movie;

  const MoviesDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<MoviesDetailPage> createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {
  DateTime? selectedDate;
  String? selectedTime;
  bool isLoading = false;
  List<Booking>? movieBooking;
  BoookingController _bookingController = BoookingController();

  void selectDate(DateTime date) {
    setState(() {
      print("selectDate is called");
      selectedDate = date;
      print(date);
    });
  }

  void selectTime(String time) {
    setState(() {
      print("selectTime is called");
      print(time);
      selectedTime = time;
    });
  }

  DateTime? combineDateAndTime(DateTime? date, String? time) {
    if (date == null || time == null) return null;
    final startTime = time.split('-')[0]; // e.g., "11:00"
    final startHour = int.parse(startTime.split(':')[0]);
    DateTime combinedDateTime =
        DateTime(date.year, date.month, date.day, startHour);

    return combinedDateTime;
  }

  String formatTimestamp(DateTime timestamp) {
    return DateFormat.yMMMMd().add_jm().format(timestamp);
  }

  int _calculateTimeSlotCount() {
    final now = DateTime.now();
    if (selectedDate == null ||
        (selectedDate!.day == now.day &&
            selectedDate!.month == now.month &&
            selectedDate!.year == now.year)) {
      // If today or no date selected, show slots from next hour till 22:00
      final endOfDay = DateTime(now.year, now.month, now.day, 22);
      final hoursLeft = endOfDay.difference(now).inHours;
      return hoursLeft > 0 ? hoursLeft : 0;
    } else {
      // If a different date is selected, show full slots from 8:00 to 22:00
      return 14; // Slots from 8:00 to 22:00 (14 hours)
    }
  }

  String _getTimeSlot(int index) {
    final now = DateTime.now();
    int startHour;
    if (selectedDate == null ||
        (selectedDate!.day == now.day &&
            selectedDate!.month == now.month &&
            selectedDate!.year == now.year)) {
      startHour = now.hour + 1 + index;
    } else {
      startHour = 8 + index;
    }
    final endHour = startHour + 1;
    return '$startHour:00-$endHour:00';
  }

  void _getMovieBooking() async {
    print('_getLawyers start');
    movieBooking = await _bookingController.fetchBooking(
        "movie.id", widget.movie as String);
    print(movieBooking?.length);
  }

  @override
  // trigger when page is loaded for first time
  void initState() {
    super.initState();
    _getMovieBooking();
    _bookingController.onSync.listen((bool syncState) {
      setState(() {
        isLoading = syncState;
      });
    });
  }

  bool isTimeSlotAvailable(String timeSlot) {
    if (selectedDate == null || movieBooking == null) {
      return true; // หรือตั้งค่าให้เหมาะสมตามที่ต้องการ
    }

    DateTime? potentialBookingTime = combineDateAndTime(selectedDate, timeSlot);
    if (potentialBookingTime == null) return true;

    return movieBooking!.every((booking) {
      return booking.scheduleTime != potentialBookingTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4.0,
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    widget.movie.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                  title: Text(
                    widget.movie.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    'Genre: ${widget.movie.genre}\nLength: ${widget.movie.length}\nSource: ${widget.movie.source}',
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Book Date',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              Container(
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    DateTime date = DateTime.now().add(Duration(days: index));
                    return DateBox(
                        date: date,
                        isSelected: selectedDate != null &&
                            selectedDate!.year == date.year &&
                            selectedDate!.month == date.month &&
                            selectedDate!.day == date.day,
                        onSelect: selectDate);
                  },
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Book Time',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 8),
              Container(
                height: 90,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _calculateTimeSlotCount(),
                  itemBuilder: (context, index) {
                    final timeSlot = _getTimeSlot(index);
                    return TimeBox(
                      time: timeSlot,
                      isSelected: selectedTime == timeSlot,
                      isAvailable: isTimeSlotAvailable(timeSlot),
                      onSelect: selectTime,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    DateTime? bookingDateTime =
                        combineDateAndTime(selectedDate, selectedTime);

                    if (bookingDateTime != null) {
                      try {
                        // String? movieId = BookingsProvider.;

                        Map<String, dynamic> bookingData = {
                          'scheduleTime': Timestamp.fromDate(
                              bookingDateTime), // ที่ต้องการแก้ไข
                          'movieId': widget.movie.id, // ที่ต้องการแก้ไข
                          'timeStamp': Timestamp.now(),
                        };
                        print("appointmentData: $bookingData");

                        Booking? newBooking =
                            await _bookingController.addBooking(bookingData);
                        print(newBooking?.toJson());

                        context
                            .read<BookingsProvider>()
                            .addBooking(newBooking!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingPage(),
                          ),
                        );
                      } catch (e, stacktrace) {
                        print("Error booking appointment: $e");
                        print("Stack Trace: $stacktrace");
                      }
                    } else {
                      print("Invalid date or time selected.");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFF263238),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Book Appointment',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

class DateBox extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final Function(DateTime) onSelect;

  DateBox(
      {required this.date, this.isSelected = false, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(date),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueGrey[400] : Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${date.day}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '${_getMonthAbbreviation(date.month)}',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}

class TimeBox extends StatelessWidget {
  final String time;
  final bool isSelected;
  final bool isAvailable; // New flag for availability
  final Function(String) onSelect;

  TimeBox({
    required this.time,
    this.isSelected = false,
    this.isAvailable = true, // Default to true
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final times = time.split('-');
    TextStyle textStyle(bool isAvailable) {
      return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isAvailable
            ? Colors.black
            : Colors.grey, // Lighter color for unavailable times
      );
    }

    return GestureDetector(
      onTap:
          isAvailable ? () => onSelect(time) : null, // Disable if not available
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isAvailable
              ? (isSelected ? Colors.blueGrey[400] : Colors.blueGrey[100])
              : Colors.grey[300], // Change color if not available
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(times[0], style: textStyle(isAvailable)), // Start time
            Text("-", style: textStyle(isAvailable)), // Separator
            Text(times[1], style: textStyle(isAvailable)), // End time
          ],
        ),
      ),
    );
  }
}
