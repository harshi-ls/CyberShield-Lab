import 'package:flutter/material.dart';
import 'splash_screen.dart';


void main() {
  runApp(const CyberShieldApp());
}

class CyberShieldApp extends StatelessWidget {
  const CyberShieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CyberShield',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050816),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

class CyberShieldHome extends StatelessWidget {
  const CyberShieldHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CyberShield",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyanAccent,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Cybersecurity Awareness Platform",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.cyanAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.cyanAccent,
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.security,
                      color: Colors.cyanAccent,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // STATUS CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyanAccent.withOpacity(0.25),
                      Colors.blue.withOpacity(0.15),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(0.4),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "System Status",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "SECURE",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "No threats detected. All monitoring systems operational.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Security Modules",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  children: const [
                    CyberCard(
                      title: "Phishing Simulator",
                      icon: Icons.email_outlined,
                    ),
                    CyberCard(
                      title: "Password Checker",
                      icon: Icons.lock_outline,
                    ),
                    CyberCard(
                      title: "Threat Monitor",
                      icon: Icons.warning_amber_rounded,
                    ),
                    CyberCard(
                      title: "Cyber Quiz",
                      icon: Icons.quiz_outlined,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CyberCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CyberCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B1220),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.cyanAccent.withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 42,
            color: Colors.cyanAccent,
          ),
          const SizedBox(height: 18),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}