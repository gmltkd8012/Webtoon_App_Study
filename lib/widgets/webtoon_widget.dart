import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_class_study04/widgets/thumb_widget.dart';
import 'package:nomad_class_study04/screen/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                  DetailScreen(
                      title: title,
                      thumb: thumb,
                      id: id,
                  ),
                fullscreenDialog: true
            ),
        );
      },
      child: Column(
        children: [
          Thumbnail(
            thumb: thumb,
            id: id,
          ),
          SizedBox(
            height: 10,
          ),
          Text(title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
