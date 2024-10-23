import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logicalc Landing Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF64B5F6),
          primary: const Color(0xFF64B5F6),
          secondary: const Color(0xFF4FC3F7),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _nextPage() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Logicalc', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('About', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Contact', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                _buildFeaturePage(
                  icon: Icons.check_circle,
                  title: 'Efficient Conversions',
                  description: 'Convert equations, diagrams, and generate truth tables.',
                ),
                _buildFeaturePage(
                  icon: Icons.calculate,
                  title: 'Analyze Your Data',
                  description: 'Utilize our tools to analyze your logical equations and data.',
                ),
                _buildFeaturePage(
                  icon: Icons.table_chart,
                  title: 'Generate Truth Tables',
                  description: 'Easily create truth tables from your logical expressions.',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: _previousPage,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: _nextPage,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConversionPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text('Get Started', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFeaturePage({required IconData icon, required String title, required String description}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: const Text('Logicalc', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ConversionPage extends StatelessWidget {
  const ConversionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your conversion type!',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EquationInputPage()),
                );
              },
              child: const Text(
                'Convert Equation',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Convert Equation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Truth Table',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            // Redirect to Camera Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CameraPage()),
            );
          }
        },
      ),
    );
  }
}

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: const Text(
          'Camera functionality coming soon!',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

class EquationInputPage extends StatefulWidget {
  const EquationInputPage({super.key});

  @override
  _EquationInputPageState createState() => _EquationInputPageState();
}

class _EquationInputPageState extends State<EquationInputPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equation Input', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Input your equation:',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Equation',
              ),
            ),
            const SizedBox(height: 20),
            CustomKeyboard(onKeyPressed: (value) {
              setState(() {
                _controller.text += value;
              });
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add conversion logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: const Text('Convert', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion Result', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: const Text(
          'Result of the conversion will be shown here.',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

// History Page
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: const Text(
          'History of conversions will be displayed here.',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

// Custom Keyboard Widget
class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;

  const CustomKeyboard({super.key, required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildKey('A'),         // Variable A
        _buildKey('B'),         // Variable B
        _buildKey('C'),         // Variable C
        _buildKey('∧'),         // Logical AND (symbol: ∧)
        _buildKey('∨'),         // Logical OR (symbol: ∨)
        _buildKey('¬'),         // Logical NOT (symbol: ¬)
        _buildKey('↑'),         // Logical NAND (symbol: ↑)
        _buildKey('↓'),         // Logical NOR (symbol: ↓)
        _buildKey('⊕'),         // Logical XOR (symbol: ⊕)
        _buildKey('⊙'),         // Logical XNOR (symbol: ⊙)
        _buildKey('('),         // Open parenthesis
        _buildKey(')'),         // Close parenthesis
        _buildKey('Clear'),     // Clear
      ],
    );
  }

  Widget _buildKey(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Space between buttons
      child: ElevatedButton(
        onPressed: () {
          onKeyPressed(label);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Smaller button size
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16), // Larger font size
        ),
      ),
    );
  }
}
