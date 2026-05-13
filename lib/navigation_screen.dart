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

class ThreatScreen extends StatefulWidget {
  const ThreatScreen({super.key});

  @override
  State<ThreatScreen> createState() => _ThreatScreenState();
}

class _ThreatScreenState extends State<ThreatScreen>
    with SingleTickerProviderStateMixin {
      late AnimationController _controller;
      @override
void initState() {
  super.initState();

  _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat();
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

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
             child: AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Stack(
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
                  CustomPaint(
  size: const Size(double.infinity, double.infinity),
  painter: AttackLinePainter(_controller.value),
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
                );
              },
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
class AttackPath {
  final Offset start;
  final Offset end;

  AttackPath(this.start, this.end);
}
class AttackLinePainter extends CustomPainter {
  final double animationValue;

  AttackLinePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent.withOpacity(0.7)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final glowPaint = Paint()
      ..color = Colors.redAccent.withOpacity(0.25)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    final List<AttackPath> attacks = [
  AttackPath(
    const Offset(120, 90),
    const Offset(500, 130),
  ),
  AttackPath(
    const Offset(180, 230),
    const Offset(650, 180),
  ),
  AttackPath(
    const Offset(300, 120),
    const Offset(900, 250),
  ),
  AttackPath(
    const Offset(700, 80),
    const Offset(400, 260),
  ),
];

    for (var attack in attacks) {
      final start = attack.start;
final end = attack.end;

      canvas.drawLine(start, end, glowPaint);
      canvas.drawLine(start, end, paint);

      final dx = start.dx + (end.dx - start.dx) * animationValue;
      final dy = start.dy + (end.dy - start.dy) * animationValue;

      final animatedDot = Paint()
        ..color = Colors.cyanAccent
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(dx, dy),
        5,
        animatedDot,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}