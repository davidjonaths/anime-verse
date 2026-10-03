import 'package:flutter/material.dart';
import '../models/anime.dart';
import '../screens/detail_screen.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;

  const AnimeCard({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  id: anime.id,
                  title: anime.title,
                  imagePath: anime.imagePath,
                  genre: anime.genre,
                  rating: anime.rating,
                  totalEpisodes: anime.totalEpisodes,
                  description: anime.description,
                ),
              ),
            );
          },
          child: SizedBox(
            width: cardWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image section
                Expanded(
                  flex: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth *
                        0.03),
                    child: Image.asset(
                      anime.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade800,
                          child: const Icon(Icons.broken_image, color: Colors.white54),
                        );
                      },
                    ),
                  ),
                ),
                // Title section
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.015,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Center(
                      child: Text(
                        anime.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
