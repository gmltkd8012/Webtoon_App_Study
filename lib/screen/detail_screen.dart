import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_class_study04/models/widgets/thumb_widget.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Thumbnail(
            thumb: thumb,
            id: id,
          ),
        ],
      ),
    );
  }
}
