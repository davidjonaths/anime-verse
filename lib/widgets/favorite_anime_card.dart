import 'package:flutter/material.dart';
import '../models/anime.dart';
import '../screens/detail_screen.dart';

class FavoriteAnimeCard extends StatelessWidget {
  final Anime anime;

  const FavoriteAnimeCard({
    super.key,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        color: const Color(0xFF0b395e),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
                child: Image.asset(
                  anime.imagePath,
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.12,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.12,
                      color: Colors.grey.shade800,
                      child: const Icon(Icons.broken_image, color: Colors.white54),
                    );
                  },
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.title,
                      style: TextStyle(fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      anime.genre,
                      style: TextStyle(fontSize: screenWidth * 0.035,
                          color: Colors.grey),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size:
                        screenWidth * 0.04),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          anime.rating,
                          style: TextStyle(fontSize: screenWidth * 0.035,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
