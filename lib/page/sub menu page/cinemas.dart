import 'package:flutter/material.dart';

// Tab 3: Daftar bioskop dengan alamat dan jam operasional
class CinemasTab extends StatelessWidget {
  const CinemasTab({super.key});

  final List<Map<String, String>> _cinemas = const [
    {
      'name': 'Cinema XXI Jakarta Selatan',
      'address': 'Jl. Mampang Prapatan No. 15',
      'hours': '10:00 - 22:00',
    },
    {
      'name': 'CGV Bandung',
      'address': 'Jl. Dago No. 35',
      'hours': '09:00 - 23:00',
    },
    {
      'name': 'Cinepolis Surabaya',
      'address': 'Jl. Basuki Rahmat No. 45',
      'hours': '10:00 - 21:30',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _cinemas.length,
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.deepOrange),
      itemBuilder: (context, index) {
        final cinema = _cinemas[index];
        return ListTile(
          leading: const Icon(Icons.local_movies, color: Colors.deepOrange),
          title: Text(
            cinema['name']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
          ),
          subtitle: Text(
            '${cinema['address']!}\nJam operasional: ${cinema['hours']!}',
            style: const TextStyle(color: Colors.white70),
          ),
          isThreeLine: true,
        );
      },
    );
  }
}
