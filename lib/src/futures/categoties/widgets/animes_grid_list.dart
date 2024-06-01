import 'package:anime_app/src/futures/anime/pages/anime_details_screen.dart';
import 'package:anime_app/src/models/anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnimesGridList extends StatelessWidget {
  const AnimesGridList({
    super.key,
    required this.title,
    required this.animes,
  });

  final String title;
  final Iterable<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      itemCount: animes.length,
      itemBuilder: (context, index) {
        final anime = animes.elementAt(index);

        return AnimeGridTile(anime: anime);
      },
    );
  }
}

class AnimeGridTile extends StatelessWidget {
  const AnimeGridTile({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AnimeDetailsScreen(id: anime.node.id);
            },
          ),
        );
      },
      child: Material(
        child: CachedNetworkImage(
          imageUrl: anime.node.mainPicture.medium,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
