import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Thumbnail extends StatelessWidget {
  final String thumb;

  const Thumbnail({
    super.key,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String>? headers;

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      headers = {
        // Naver 이미지 url 사용시, 권한없는 사용자의 접근으로 의심되면 403 return 하여 아래 header 적용
        "User-Agent":
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      };
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(10, 15),
              color: Colors.black.withOpacity(0.5),
            )
          ]
      ),
      width: 250,
      clipBehavior: Clip.hardEdge,
      child: Image.network(thumb,
        headers: headers,
      ),
    );
  }
}
