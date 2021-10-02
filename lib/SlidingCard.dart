import 'package:flutter/material.dart';

import 'Movie.dart';

class SlidingCard extends StatelessWidget {
  final double offset;

  /// 电影模型
  final Movie movie;

  const SlidingCard({Key? key, required this.movie, required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          child: Card(
            child: Image.asset(
              '${movie.poster}',
              alignment: Alignment(-offset.abs() * 0.2, 0),
              fit: BoxFit.cover,
            ),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 12,
            margin: EdgeInsets.only(bottom: 26, right: 10, top: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, bottom: 40, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    movie.intro,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
