import 'package:anime_app/src/futures/anime/pages/anime_details_screen.dart';
import 'package:anime_app/src/futures/anime/widgets/anime_tile.dart';
import 'package:anime_app/src/models/anime_node.dart';
import 'package:flutter/material.dart';

class SimilarAnimesView extends StatelessWidget {
  const SimilarAnimesView({
    super.key,
    required this.animes,
    required this.label,
  });

  final List<AnimeNode> animes;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Tile Part
        SizedBox(
          height: 50,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: animes.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              final anime = animes.elementAt(index);

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimeDetailsScreen(id: anime.id),
                    ),
                  );
                },
                child: AnimeTile(anime: anime),
              );
            },
          ),
        ),
      ],
    );
  }
}
