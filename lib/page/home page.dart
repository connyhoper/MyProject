import 'package:flutter/material.dart';
import 'package:tablayout/page/menu page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bckg.png'), // Pastikan file ini ada
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay for readability
          Container(color: Colors.black.withOpacity(0.4)),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.local_movies,
                  size: 80,
                  color: Colors.deepOrange,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome 2 Absolute Cinema!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Find and book tickets for your favorite movie here.',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuPage()),
                    );
                  },
                  icon: const Icon(Icons.movie_filter),
                  label: const Text("Explore Now"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor:
                        Colors.white, // <-- ini untuk teks & icon warna putih
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
