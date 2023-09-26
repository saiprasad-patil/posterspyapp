import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class PosterGrid extends StatefulWidget {
  const PosterGrid({super.key});

  @override
  State<PosterGrid> createState() => _PosterGridState();
}

class _PosterGridState extends State<PosterGrid> {
  List<String> allImages = [];
  final baseurl = 'https://posterspy.com/';
  Future<List<String>> getAllImages() async {
    final url = Uri.parse('$baseurl/posters/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    allImages = html
        .querySelectorAll('a > img')
        .map((e) => e.attributes['src']!)
        .toList();
    return allImages;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: getAllImages(),
          builder: (context, snaphot) {
            if (snaphot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: GridView.builder(
                    itemCount: allImages.length - 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Image.network(allImages[index + 1],
                            fit: BoxFit.cover),
                      );
                    }),
              );
            }
          }),
    );
  }
}
