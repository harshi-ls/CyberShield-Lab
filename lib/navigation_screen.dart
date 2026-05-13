import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const CyberShieldHome(),
    const ThreatScreen(),
    const PhishingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFF0B1220),
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_rounded),
            label: "Threats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined),
            label: "Phishing",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class ThreatScreen extends StatelessWidget {
  const ThreatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> threats = [
      {
        "country": "Russia → USA",
        "type": "Malware Injection"
      },
      {
        "country": "China → Germany",
        "type": "Phishing Attack"
      },
      {
        "country": "Brazil → UK",
        "type": "Ransomware Activity"
      },
      {
        "country": "India → UAE",
        "type": "Suspicious Login Attempt"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Threat Intelligence",
          style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            // MAP CONTAINER
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF0B1220),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.cyanAccent.withOpacity(0.3),
                ),
              ),
              child: Stack(
                children: [

                  // WORLD MAP
                  Center(
                    child: Opacity(
                      opacity: 0.25,
                      child: SvgPicture.asset(
                        'assets/images/world_map.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // THREAT NODES
                  Positioned(
                    top: 90,
                    left: 120,
                    child: glowingDot(),
                  ),

                  Positioned(
                    top: 130,
                    right: 100,
                    child: glowingDot(),
                  ),

                  Positioned(
                    bottom: 70,
                    left: 180,
                    child: glowingDot(),
                  ),

                  Positioned(
                    bottom: 100,
                    right: 150,
                    child: glowingDot(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // LIVE FEED
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF0B1220),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Live Threat Feed",
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Expanded(
                      child: ListView.builder(
                        itemCount: threats.length,
                        itemBuilder: (context, index) {
                          final threat = threats[index];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 14),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: Colors.redAccent.withOpacity(0.4),
                              ),
                            ),
                            child: Row(
                              children: [

                                const Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.redAccent,
                                ),

                                const SizedBox(width: 15),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        threat["country"]!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      Text(
                                        threat["type"]!,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget glowingDot() {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.8),
            blurRadius: 15,
            spreadRadius: 4,
          ),
        ],
      ),
    );
  }
}

class PhishingScreen extends StatelessWidget {
  const PhishingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF050816),
      body: Center(
        child: Text(
          "Phishing Awareness Screen",
          style: TextStyle(
            color: Colors.cyanAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF050816),
      body: Center(
        child: Text(
          "User Profile Screen",
          style: TextStyle(
            color: Colors.cyanAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}