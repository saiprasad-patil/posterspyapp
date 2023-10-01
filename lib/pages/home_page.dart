import 'package:flutter/material.dart';
import 'package:posterspyapp/components/poster_grid.dart';
import 'package:posterspyapp/components/poster_types.dart';
import 'package:posterspyapp/components/type_provider.dart';
import 'package:posterspyapp/pages/info_page.dart';
import 'package:provider/provider.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "PosterSpy",
              ),
              Row(
                children: [
                  Consumer<TypeProvider>(
                    builder: (context, typeProviderModel, child) => IconButton(
                      onPressed: () {
                        typeProviderModel.reload();
                      },
                      icon: const Icon(
                        Icons.replay,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoPage()));
                      },
                      icon: const Icon(
                        Icons.info,
                        color: Colors.white,
                      )),
                ],
              )
            ],
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
