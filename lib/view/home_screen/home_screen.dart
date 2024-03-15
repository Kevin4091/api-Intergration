import 'package:api/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final _HomeScreenState =
        Provider.of<HomeScreenController>(context, listen: false);
    return Scaffold(
      body: ListView.builder(
        itemCount: _HomeScreenState.resModel?.entries?.length ?? 0,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text(_HomeScreenState.resModel?.entries?[index].api ?? "empty"),
        ),
      ),
    );
  }
}
