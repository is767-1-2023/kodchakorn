import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            // พื้นหลังขอขอบมนและมีเงา
            Positioned(
              top: 100,
              child: Container(
                width: 415,
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 180, 220, 250),
                  borderRadius: BorderRadius.circular(20), // ขอบมน
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // สีเงา
                      blurRadius: 8,
                      offset: Offset(0, 2), // ตำแหน่งของเงา
                    ),
                  ],
                ),
              ),
            ),
            // รูป
            Positioned(
              right: -120,
              top: 0, // ทำให้รูปลอยออกมา
              child: Image.asset(
                'images/fashion.jpg', // เปลี่ยนเป็นที่อยู่ของรูปภาพของคุณ
                width: 400, // ขนาดของรูปภาพ
                height: 400,
              ),
            ),
            // ข้อความ
            Positioned(
              left: 16,
              top: 16,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\n\n\n\nอยากขายเสื้อผ้า\nแต่ไม่รู้จะขายอะไรใช่ไหม?',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'เริ่มต้นเปิดร้านของคุณทันที',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
