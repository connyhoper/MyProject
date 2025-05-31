import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:async_button_builder/async_button_builder.dart';

class TicketForm extends StatefulWidget {
  const TicketForm({super.key});

  @override
  State<TicketForm> createState() => _TicketFormState();
}

class _TicketFormState extends State<TicketForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  static const List<String> _cityOptions = [
    'Bandung',
    'Jakarta Pusat',
    'Jakarta Barat',
    'Jakarta Selatan',
    'Jakarta Timur',
    'Jakarta Utara',
    'Surabaya',
    'Yogyakarta',
    'Tangerang (BSD)',
  ];
  String _selectedCity = '';

  static const List<String> _movieOptions = [
    'Avengers: Endgame',
    'Spider-Man: No Way Home',
    'The Batman',
    'Dune',
    'John Wick 4',
    'Oppenheimer',
  ];
  String _selectedMovie = '';

  final List<String> _screenTypes = ['2D', '3D', 'IMAX'];
  String _selectedScreenType = '2D';

  final Map<String, bool> _seats = {
    'A1': false,
    'A2': false,
    'A3': false,
    'B1': false,
    'B2': false,
    'B3': false,
  };

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content: Text(message, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
    );
  }

  Future<void> _handleOrder() async {
    final name = _nameController.text.trim();
    final city = _selectedCity.trim();
    final movie = _selectedMovie.trim();
    final date = _dateController.text.trim();
    final time = _timeController.text.trim();
    final screen = _selectedScreenType.trim();
    final selectedSeats = _seats.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (name.isEmpty ||
        city.isEmpty ||
        movie.isEmpty ||
        date.isEmpty ||
        time.isEmpty ||
        screen.isEmpty ||
        selectedSeats.isEmpty) {
      _showAlert(
        'Peringatan',
        'Semua field harus diisi dan pilih minimal satu bangku!',
      );
      return;
    }

    await Future.delayed(const Duration(seconds: 2));

    _showAlert(
      'Sukses',
      'Pemesanan berhasil!\n'
          'Nama: $name\n'
          'Kota: $city\n'
          'Film: $movie\n'
          'Tanggal: $date\n'
          'Waktu: $time\n'
          'Tipe Layar: $screen\n'
          'Bangku: ${selectedSeats.join(', ')}',
    );
  }

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
                image: AssetImage('images/bckg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(color: Colors.black.withOpacity(0.6)),
          // Form content
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Kota'),
                  dropdownColor: const Color(0xFF1F1F1F),
                  items: _cityOptions
                      .map(
                        (city) =>
                            DropdownMenuItem(value: city, child: Text(city)),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value ?? '';
                    });
                  },
                  value: _selectedCity.isEmpty ? null : _selectedCity,
                ),
                const SizedBox(height: 10),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return _movieOptions.where(
                      (option) => option.toLowerCase().contains(
                        textEditingValue.text.toLowerCase(),
                      ),
                    );
                  },
                  onSelected: (selection) {
                    setState(() {
                      _selectedMovie = selection;
                    });
                  },
                  fieldViewBuilder:
                      (
                        context,
                        textEditingController,
                        focusNode,
                        onFieldSubmitted,
                      ) {
                        textEditingController.addListener(() {
                          setState(() {
                            _selectedMovie = textEditingController.text;
                          });
                        });

                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          decoration: const InputDecoration(labelText: 'Film'),
                          style: const TextStyle(color: Colors.white),
                        );
                      },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tipe Layar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.amberAccent,
                  ),
                ),
                Column(
                  children: _screenTypes
                      .map(
                        (type) => RadioListTile<String>(
                          title: Text(type),
                          value: type,
                          groupValue: _selectedScreenType,
                          onChanged: (value) {
                            setState(() {
                              _selectedScreenType = value ?? '2D';
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Pilih Bangku',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.amberAccent,
                  ),
                ),
                Wrap(
                  spacing: 10,
                  children: _seats.keys
                      .map(
                        (seat) => FilterChip(
                          label: Text(seat),
                          selected: _seats[seat]!,
                          onSelected: (selected) {
                            setState(() {
                              _seats[seat] = selected;
                            });
                          },
                          selectedColor: Colors.orange,
                          backgroundColor: Colors.white12,
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'Tanggal'),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dateController.text = DateFormat(
                          'EEEE, dd MMMM yyyy',
                        ).format(pickedDate);
                      });
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _timeController,
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'Waktu'),
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _timeController.text = pickedTime.format(context);
                      });
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                AsyncButtonBuilder(
                  child: const Text(
                    'Pesan Tiket',
                    style: TextStyle(color: Colors.white),
                  ),
                  loadingWidget: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  onPressed: _handleOrder,
                  builder: (context, child, callback, buttonState) {
                    final buttonColor = buttonState.when(
                      idle: () => Colors.orange,
                      loading: () => Colors.grey,
                      success: () => Colors.green,
                      error: (err, stack) => Colors.red,
                    );
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: callback,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: child,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
