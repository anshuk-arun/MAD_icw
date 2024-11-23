import 'package:flutter/material.dart';

// Entry Point of a Flutter App
void main() {
  runApp(MyApp());
}

// Says this is the root.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Comes from the Import
    return MaterialApp(
      // Coordinate between the Tab Bar
      home: DefaultTabController(
        // Amount of Tabs
        length: 3,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

// Can be changed, stateful
class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

// Tied to the Tab Interface.
class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;
  // When app is being built, moves the view to the tabIndex. 
  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

 
  // Restores back to the original state.
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  // Initalize the Tab Controller. Adds Listener.
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    // Update the Tab when you select the Tab
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  // If you select a different tab, dispose of the current tab/ui.
  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  // X-axis/Y-axis Horizontal/Vertical alignment of the tabs
  // not here rn

  // Pass all the methods into the Scaffold/basic app structure/staging area. Then build it. 
  @override
  Widget build(BuildContext context) {
// For the ToDo task hint: consider defining the widget and name of the tabs here
    final tabs = ['Tab 1', 'Tab 2', 'Tab 3'];

    // The Basic App Structure for various elements
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Tabs Demo',
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [
            for (final tab in tabs) Tab(text: tab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
// hint for the to do task:Considering creating the different for different tabs
          for (final tab in tabs)
            Center(
              child: Text(tab),
            ),
        ],
      ),
    );
  }
}
