import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BasicBottomNavigation extends StatefulWidget {
  const BasicBottomNavigation({Key? key}) : super(key: key);

  @override
  State<BasicBottomNavigation> createState() => _BasicBottomNavigationState();
}

class _BasicBottomNavigationState extends State<BasicBottomNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const _Tabbar1(),
        const _Tabbar2(),
      ][currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Text("1"), label: "Tab"),
          BottomNavigationBarItem(icon: Text("2"), label: "Tab"),
        ],
      ),
    );
  }
}

class _Tabbar1 extends StatelessWidget {
  const _Tabbar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Tabbar 1 build");
    return Scaffold(
      appBar: AppBar(title: const Text("Tab bar 1")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${index + 1}"),
          );
        },
        itemCount: 50,
      ),
    );
  }
}

class _Tabbar2 extends StatefulWidget {
  const _Tabbar2({Key? key}) : super(key: key);

  @override
  State<_Tabbar2> createState() => _Tabbar2State();
}

class _Tabbar2State extends State<_Tabbar2>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _escapedDuration = Duration.zero;

  get escapedSeconds => _escapedDuration.inSeconds.toString();

  @override
  void initState() {
    super.initState();
    print("Tabbar 2 initState");

    _ticker = createTicker((elapsed) {
      if (elapsed.inSeconds - _escapedDuration.inSeconds == 1) {
        setState(() {
          _escapedDuration = elapsed;
        });
      }
    });

    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tab bar 2")),
      body: Center(
        child: Text(escapedSeconds),
      ),
    );
  }
}

/// Tabs are only build when clicked, not at once.
/// 
/// Tabs are built everytime and not just the first
/// time they are opened.
/// 
/// The scroll position is lost when switched.