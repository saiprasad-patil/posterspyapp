import 'package:flutter/material.dart';
import 'package:posterspyapp/components/poster_grid.dart';
import 'package:posterspyapp/components/poster_types.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: EdgeInsets.only(left: mediaQuery.width * 0.05),
          child: const Text(
            "PosterSpy",
          ),
        ),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      width: double.infinity,
      height: double.infinity,
      child: const Column(
        children: [
          PosterTypes(),
          PosterGrid(),
        ],
      ),
    );
  }
}
