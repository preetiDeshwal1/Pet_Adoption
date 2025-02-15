import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Custom Painted Background
          Positioned.fill(
            child: CustomPaint(
              painter: HeaderPainter(),
            ),
          ),

          // Profile Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Adjust space for curved header

                // Profile Picture
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.blueAccent.withOpacity(0.2),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("images/profile.png"),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {
                            // Handle profile image update
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blueAccent,
                            child:
                                Icon(Icons.edit, size: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Profile Information Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildProfileField("Full Name", "Preeti", Icons.person),
                        const SizedBox(height: 15),
                        _buildProfileField(
                            "Email", "preeti@example.com", Icons.email),
                        const SizedBox(height: 15),
                        _buildProfileField(
                            "Phone", "+91 9990001110", Icons.phone),
                        const SizedBox(height: 15),
                        _buildProfileField(
                            "Location", "India", Icons.location_on),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Logout Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle logout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.logout, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "Logout",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField with Icons
  Widget _buildProfileField(String title, String value, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: title,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      controller: TextEditingController(text: value),
    );
  }
}

// Custom Painter for Curved Header
class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blueAccent;

    Path path = Path()
      ..moveTo(0, size.height * 0.4)
      ..quadraticBezierTo(
          size.width / 2, size.height * 0.2, size.width, size.height * 0.4)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
