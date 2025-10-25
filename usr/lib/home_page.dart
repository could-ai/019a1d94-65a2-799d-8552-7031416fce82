import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PlaceholderWidget(text: 'Lieux'),
    PlaceholderWidget(text: 'Événements'),
    PlaceholderWidget(text: 'Profil'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Grand-Béréby'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Lieux',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Événements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'Bienvenue à Grand-Béréby',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            hintText: 'Rechercher un lieu, un événement...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _buildCategorySection(context, 'Catégories'),
        const SizedBox(height: 8),
        _buildCategoryRow(context),
        const SizedBox(height: 24),
        _buildCategorySection(context, 'Offres du jour'),
        _buildFeaturedCard(
          context,
          'Hôtel Le Flibustier',
          '-20% sur les chambres vue sur mer',
          'https://via.placeholder.com/150',
        ),
        const SizedBox(height: 24),
        _buildCategorySection(context, 'Lieux populaires'),
        _buildFeaturedCard(
          context,
          'Baie des Sirènes',
          'Découvrez une plage paradisiaque',
          'https://via.placeholder.com/150',
        ),
      ],
    );
  }

  Widget _buildCategorySection(BuildContext context, String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCategoryRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCategoryIcon(context, Icons.hotel, 'Hôtels'),
        _buildCategoryIcon(context, Icons.restaurant, 'Restaurants'),
        _buildCategoryIcon(context, Icons.beach_access, 'Plages'),
        _buildCategoryIcon(context, Icons.local_activity, 'Activités'),
      ],
    );
  }

  Widget _buildCategoryIcon(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Icon(icon, size: 30, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildFeaturedCard(BuildContext context, String title, String subtitle, String imageUrl) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;
  const PlaceholderWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
