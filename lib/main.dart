import 'package:flutter/material.dart';

void main() {
  runApp(const StepTrackerApp());
}

class StepTrackerApp extends StatelessWidget {
  const StepTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _steps = 0;
  int _goal = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador de Pasos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pasos: $_steps', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: (_steps / _goal).clamp(0.0, 1.0),
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                _steps >= _goal ? Colors.green : Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _steps += 100;
                    });
                  },
                  child: const Text('+100 Pasos'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_steps >= 100) _steps -= 100;
                    });
                  },
                  child: const Text('-100 Pasos'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Meta de pasos'),
              onChanged: (value) {
                setState(() {
                  _goal = int.tryParse(value) ?? 10000;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _steps = 0;
                });
              },
              child: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
    );
  }
}
