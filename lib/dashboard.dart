import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  void _logout(BuildContext ctx) {
    Navigator.pushNamedAndRemoveUntil(ctx, '/', (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 253, 248, 248),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.tealAccent[700]),
                child: Text('Menu', style: TextStyle(fontSize: 20)),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashboard'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () => _logout(context),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _CardItem('Create Lead', Icons.person_add, () {}),
            _CardItem('Credit Eligibility', Icons.credit_score, () {}),
            _CardItem('Leads History', Icons.history, () {}),
            _CardItem('Profile', Icons.account_circle, () {}),
          ],
        ),
      ),
    );
  }

  Widget _CardItem(String title, IconData icon, VoidCallback onTap) {
    return Card(
      color: Color.fromARGB(255, 251, 247, 247),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.teal),
              SizedBox(height: 12),
              Text(title, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}