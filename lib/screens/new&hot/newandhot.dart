import 'package:flutter/material.dart';

class NewandHotScreen extends StatefulWidget {
  const NewandHotScreen({super.key});

  @override
  State<NewandHotScreen> createState() => _NewandHotScreenState();
}

class _NewandHotScreenState extends State<NewandHotScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: Column(
      //   children: [
      //     TabBar(tabs: [
      //       Tab(
      //         text: 'Coming Soon',
      //       ),
      //       Tab(
      //         text: 'Free - Newly Added',
      //       )
      //     ]),
      //     TabBarView(
      //       children: [],
      //     )
      //   ],
      // ),
    );
  }
}
