import 'package:flutter/material.dart';

// Tab 2: Upcoming Movies dengan poster dan tanggal rilis
class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key});

  final List<Map<String, String>> _upcoming = const [
    {
      'movie': 'The Marvels',
      'release': '10 November 2025',
      'image':
          'https://image.tmdb.org/t/p/w500/9GBhzXMFjgcZ3FdR9w3bUMMTps5.jpg',
    },
    {
      'movie': 'Wonka',
      'release': '15 Desember 2025',
      'image':
          'https://image.tmdb.org/t/p/w500/qhb1qOilapbapxWQn9jtRCMwXJF.jpg',
    },
    {
      'movie': 'Kung Fu Panda 4',
      'release': '29 Maret 2025',
      'image':
          'https://image.tmdb.org/t/p/w500/1ZNOOMmILNUzVYbzG1j7GYb5bEV.jpg',
    },
    {
      'movie': 'Godzilla x Kong: The New Empire',
      'release': '12 April 2025',
      'image':
          'https://image.tmdb.org/t/p/w1280/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _upcoming.length,
      itemBuilder: (context, index) {
        final movie = _upcoming[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie['image']!,
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 140,
                    color: Colors.grey,
                    child: const Icon(Icons.broken_image, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie['movie']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Release Date: ${movie['release']}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Notifikasi untuk "${movie['movie']}" berhasil diaktifkan!',
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.notifications),
                      label: const Text("Notify Me"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
