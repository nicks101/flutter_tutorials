import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Changes:
/// Using [IndexedStack] to preserve state

class IndexedStackDemo extends StatefulWidget {
  const IndexedStackDemo({Key? key}) : super(key: key);

  @override
  State<IndexedStackDemo> createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          _Tabbar1(),
          _Tabbar2(),
        ],
      ),
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
/// Tabs are only built all at once, when the super class is build (demo class)
///
/// The scroll position is preserved when switched.
/// 
/// -----------
/// 
/// Encontered following error on Flutter Desktop:
/// ════════ Exception caught by animation library ════════════════════════════
/// The provided ScrollController is currently attached to more than one ScrollPosition.
/// 
/// After googling, this explains why this error occurs
/// https://github.com/flutter/flutter/issues/93862
/// 
/// Applying the solution recommended for this, the error is resolved.
