import 'package:flutter/material.dart';

// Tab 1: Now Showing (List jadwal film sekarang)
class NowShowingTab extends StatelessWidget {
  const NowShowingTab({super.key});

  final List<Map<String, String>> _schedule = const [
    {
      'movie': 'Avengers: Endgame',
      'city': 'Jakarta Selatan',
      'date': 'Sabtu, 25 Mei 2025',
      'time': '19:00',
      'screen': 'IMAX',
      'image':
          'https://media.themoviedb.org/t/p/w1066_and_h600_bestv2/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg',
    },
    {
      'movie': 'John Wick 4',
      'city': 'Jakarta Selatan',
      'date': 'Sabtu, 25 Mei 2025',
      'time': '19:00',
      'screen': 'IMAX',
      'image':
          'https://media.themoviedb.org/t/p/w1066_and_h600_bestv2/7I6VUdPj6tQECNHdviJkUHD2u89.jpg',
    },
    {
      'movie': 'Oppenheimer',
      'city': 'Bandung',
      'date': 'Minggu, 26 Mei 2025',
      'time': '20:00',
      'screen': '3D',
      'image':
          'https://media.themoviedb.org/t/p/w1066_and_h600_bestv2/neeNHeXjMF5fXoCJRsOmkNGC7q.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _schedule.length,
      itemBuilder: (context, index) {
        final item = _schedule[index];
        return Container(
          height: 200,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(item['image']!),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🎬 ${item['movie']!}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '📍 Kota: ${item['city']!}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    '📅 Tanggal: ${item['date']!}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    '⏰ Waktu: ${item['time']!}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    '🖥️ Tipe Layar: ${item['screen']!}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
