import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../control/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProfileController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.orange.shade100, 
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Text(
                controller.userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 30),

            
            _buildMenuItem(Icons.shopping_cart, "My Order"),
            const SizedBox(height: 15),

            
            _buildMenuItem(Icons.person, "My Profile"),
            const SizedBox(height: 15),

            
            _buildMenuItem(Icons.settings, "Settings"),
            const SizedBox(height: 15),

            
            _buildMenuItem(Icons.help_outline, "Help"),
            const SizedBox(height: 15),

            
            _buildMenuItem(Icons.contact_mail, "Contact Us"),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
         
        },
      ),
    );
  }
}
