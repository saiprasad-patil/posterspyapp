import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
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
    final mediaQuery = MediaQuery.sizeOf(context);
    return Container(
        color: Theme.of(context).canvasColor,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(mediaQuery.width / 10),
          child: const Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "PosterSpy is an online community and platform that showcases and celebrates alternative movie posters, fan art, and creative artwork inspired by popular films, TV shows, and video games. It serves as a hub for artists to share their work, gain exposure, and connect with fellow enthusiasts.",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "The primary focus of PosterSpy is to provide a space for artists to showcase their talent and creativity by reimagining pop culture in their own unique styles. These alternative posters often offer fresh and visually striking interpretations of well-known media, capturing the essence of the story, characters, or themes in a fresh and captivating way. Artists can submit their work to the platform, where it is then curated and featured on the PosterSpy social media channels.",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "We also collaborate with studios, distributors, and organizations to provide opportunities for artists to collaborate on licensed projects and create official promotional artwork.",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
