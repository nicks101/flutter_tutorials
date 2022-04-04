import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Changes:
/// Using AutomaticKeepAliveClientMixin to preserve state

class AliveMixinDemo extends StatefulWidget {
  const AliveMixinDemo({Key? key}) : super(key: key);

  @override
  State<AliveMixinDemo> createState() => _AliveMixinDemoState();
}

class _AliveMixinDemoState extends State<AliveMixinDemo> {
  final PageController controller = PageController();

  int currentIndex = 0;
  final tabPages = [
    const _Tabbar1(),
    const _Tabbar2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: tabPages,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          controller.jumpToPage(index);
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

class _Tabbar1 extends StatefulWidget {
  const _Tabbar1({Key? key}) : super(key: key);

  @override
  State<_Tabbar1> createState() => _Tabbar1State();
}

class _Tabbar1State extends State<_Tabbar1> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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

  @override
  bool get wantKeepAlive => true;
}

class _Tabbar2 extends StatefulWidget {
  const _Tabbar2({Key? key}) : super(key: key);

  @override
  State<_Tabbar2> createState() => _Tabbar2State();
}

class _Tabbar2State extends State<_Tabbar2>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Tab bar 2")),
      body: Center(
        child: Text(escapedSeconds),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/// Tabs are only build when clicked, not at once.
///
/// Tabs are built only the first time they are opened.
///
/// The scroll position is preserved when switched.
/// 
/// -----------
/// 
/// Implementation:
/// To use AutomaticKeepAliveClientMixin, we need PageView
/// in super class (demo class) to use this.
/// Other than PageView, there's a TabBarView (for top app bar tabs),
/// which also makes AutomaticKeepAliveClientMixin work for
/// tabs (child classes) because it uses PageView internally.
/// 
/// ------- 
/// Preserving state choice dynamically:
/// https://stackoverflow.com/questions/67616057/flutter-how-to-keep-the-state-dynamically-for-widgets-inside-bottom-navigation