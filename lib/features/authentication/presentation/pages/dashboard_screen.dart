import 'package:flutter/material.dart';
import 'package:merchant_app/features/authentication/presentation/pages/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  @override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    setState(() {
      // Initialize the index on the first frame if needed
      _currentIndex = 0;
    });
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: IconButton(
            onPressed: () {
              //Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Card
              _buildUserInfoCard(),

              // Stats Cards Row
              _buildStatsCards(),

              const SizedBox(height: 16),

              // Recent Activity Card
              _buildRecentActivityCard(),

              const SizedBox(height: 16),

              // Quick Links Row
              _buildQuickLinks(),
            ],
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Profile")
        ],
        onTap: (index) {
          setState(() {
          _currentIndex = index; // Update current index on tap
        });
        FocusScope.of(context).requestFocus(FocusNode());
          if (index == 2) {
            debugPrint('print index: $index');
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
      ),
    );
  }

  // User Info Card
  Widget _buildUserInfoCard() {
    return const Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
              'assets/images/desu.png'), // Add an image to the assets folder
        ),
        title: Text('Desalegn Birhanu',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Software Engineer'),
        trailing: Icon(Icons.edit),
      ),
    );
  }

  // Stats Cards Row
  Widget _buildStatsCards() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Total Sales Card
        Expanded(
          child: Card(
            elevation: 4,
            margin: EdgeInsets.only(right: 8),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Sales',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('\$1,250',
                      style: TextStyle(fontSize: 24, color: Colors.green)),
                ],
              ),
            ),
          ),
        ),
        // Orders Card
        Expanded(
          child: Card(
            elevation: 4,
            margin: EdgeInsets.only(left: 8),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Orders',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('150',
                      style: TextStyle(fontSize: 24, color: Colors.blue)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Recent Activity Card
  Widget _buildRecentActivityCard() {
    return const Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Activity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ListTile(
              title: Text('Added new product'),
              subtitle: Text('Yesterday'),
            ),
            ListTile(
              title: Text('Completed an order'),
              subtitle: Text('2 days ago'),
            ),
          ],
        ),
      ),
    );
  }

  // Quick Links Row
  Widget _buildQuickLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Settings Card
        _buildQuickLinkCard(Icons.settings, 'Settings', () {
          // Handle settings action
        }),

        // Notifications Card
        _buildQuickLinkCard(Icons.notifications, 'Notifications', () {
          // Handle notifications action
        }),
      ],
    );
  }

  // Quick Link Card (Settings, Notifications, etc.)
  Widget _buildQuickLinkCard(IconData icon, String title, VoidCallback onTap) {
    return Expanded(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30, color: Colors.grey),
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
