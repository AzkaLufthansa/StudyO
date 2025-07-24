import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'app-logo',
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF2A2A2A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.school,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            _buildAuthButton(
              context,
              icon: Icons.g_mobiledata,
              label: 'Lanjutkan dengan Google',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Autentikasi Google akan diimplementasi'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildAuthButton(
              context,
              icon: Icons.email,
              label: 'Lanjutkan dengan Email',
              backgroundColor: Colors.transparent,
              border: Border.all(color: Colors.grey.shade700),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text(
                'Lewati dan lanjut sebagai tamu',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Border? border,
    Color? textColor,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: backgroundColor ?? Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: border,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor ?? Colors.black),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}