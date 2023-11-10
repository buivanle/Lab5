import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DownloadScreen extends StatefulWidget {
  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  bool _downloading = false;
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Download'),
              onPressed: () {
                setState(() {
                  _downloading = true;
                });
                _startDownload();
              },
            ),
            SizedBox(height: 20),
            if (_downloading) CircularProgressIndicator(value: _progress),
          ],
        ),
      ),
    );
  }

  void _startDownload() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _progress += 10.0 / Random().nextInt(6) + 10.0;
        if (_progress >= 100) {
          timer.cancel();
          _downloading = false;
        }
      });
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: DownloadScreen(),
  ));
}
