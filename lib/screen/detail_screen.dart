import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomad_class_study04/models/webtoon_detail_model.dart';
import 'package:nomad_class_study04/services/api_service.dart';
import 'package:nomad_class_study04/widgets/thumb_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/webtoon_episode_model.dart';
import '../widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  late Future<WebtoonDetailmodel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Thumbnail(
                thumb: widget.thumb,
                id: widget.id,
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: webtoon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data!.about,
                            style: TextStyle(
                              fontSize:16
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                            style: TextStyle(
                                fontSize:16
                            ),
                          ),
                        ],
                      );
                    }
                    return const Text('...');
                  },
              ),
              SizedBox(
                height: 25,
              ),
              FutureBuilder(
                  future: episodes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for(var episode in snapshot.data!)
                            Episode(
                              episode: episode,
                              webtoonid: widget.id
                            ),
                        ],
                      );
                    }
                    return Container();
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
