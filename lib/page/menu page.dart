import 'package:flutter/material.dart';
import 'package:tablayout/page/sub%20menu%20page/cinemas.dart';
import 'package:tablayout/page/sub%20menu%20page/nowshowing.dart';
import 'package:tablayout/page/sub%20menu%20page/ticket.dart';
import 'package:tablayout/page/sub%20menu%20page/upcoming.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black, // Background untuk seluruh halaman
        appBar: AppBar(
          backgroundColor: Colors.black, // AppBar tetap hitam
          title: const Text("Absolute Cinema"),
          bottom: const TabBar(
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.deepOrange,
            tabs: [
              Tab(icon: Icon(Icons.movie), text: "Now Showing"),
              Tab(icon: Icon(Icons.upcoming), text: "Upcoming"),
              Tab(icon: Icon(Icons.location_city), text: "Cinemas"),
              Tab(icon: Icon(Icons.confirmation_number), text: "Ticket"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NowShowingTab(),
            UpcomingTab(),
            CinemasTab(),
            TicketForm(),
          ],
        ),
      ),
    );
  }
}
