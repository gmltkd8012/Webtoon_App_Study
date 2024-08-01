import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_class_study04/models/webtoon_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonid,
  });

  final WebtoonEpisodeModel episode;
  final String webtoonid;

  onButtonTap() async {
    final url = Uri.parse("https://comic.naver.com/webtoon/detail?titleId=$webtoonid&no=${episode.id}");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onButtonTap();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade400,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(episode.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              Icon(Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}