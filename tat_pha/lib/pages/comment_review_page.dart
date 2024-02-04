import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentReviewPage extends StatefulWidget {
  @override
  _CommentReviewPageState createState() => _CommentReviewPageState();
}

class _CommentReviewPageState extends State<CommentReviewPage> {
  TextEditingController _commentController = TextEditingController();
  double _rating = 0.0; // จะใช้เก็บค่าดาวที่ผู้ใช้ให้

  List<Map<String, dynamic>> comments = [
    {
      'username': 'Lemon888',
      'comment': 'โรงงานบริการดี เนื้อผ้าดีตามราคา ไม่แพง ตรงตามแบบ',
      'rating': 5
    },
    // เพิ่ม comment และ rating เพิ่มเติมตามต้องการ
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('คะแนนและความคิดเห็น'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'แสดงความคิดเห็น...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // จำนวนบรรทัดสูงสุดที่จะแสดง
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ทำสิ่งที่คุณต้องการเมื่อกดปุ่มส่งความคิดเห็น
                String userComment = _commentController.text;
                comments.add({
                  'username': 'Lemon888',
                  'comment': userComment,
                  'rating': _rating
                });
                // เพิ่มโค้ดเพิ่มเติมตามความต้องการ
                print('User Comment: $userComment, Rating: $_rating');
              },
              child: Text('ส่งความคิดเห็น'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('${comments[index]['username']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBarIndicator(
                            rating: comments[index]['rating'].toDouble(),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            unratedColor: Colors.grey.shade300,
                            direction: Axis.horizontal,
                          ),
                          Text('${comments[index]['comment']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
