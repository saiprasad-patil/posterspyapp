import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:posterspyapp/components/type_provider.dart';
import 'package:provider/provider.dart';

class PosterGrid extends StatefulWidget {
  const PosterGrid({super.key});

  @override
  State<PosterGrid> createState() => _PosterGridState();
}

class _PosterGridState extends State<PosterGrid> {
  List<String> allImages = [];
  List<String> allText = [];
  final baseurl = 'https://posterspy.com/';

  Future<List<String>> getAllImages() async {
    final provider = Provider.of<TypeProvider>(context, listen: true);
    final url = Uri.parse('$baseurl${provider.pageurl}');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    allImages = html
        .querySelectorAll('a > img')
        .map((e) => e.attributes['src']!)
        .toList();
    for (var image in allImages) {
      if (image.isEmpty) {
        allImages.remove(image);
      }
    }
    return allImages;
  }

  Future<List<String>> getText() async {
    final provider = Provider.of<TypeProvider>(context, listen: true);
    final url = Uri.parse('$baseurl${provider.pageurl}');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    allText = html
        .querySelectorAll('a > img')
        .map((e) => e.attributes['alt']!)
        .toList();
    for (var text in allText) {
      if (text.isEmpty) {
        allText.remove(text);
      }
      provider.allText.add(text);
    }
    return allText;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
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
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.7),
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: mediaQuery.height * 1 / 4,
                                  width: double.infinity,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(mediaQuery.height / 50),
                                    child: Center(
                                      child: FutureBuilder(
                                          future: getText(),
                                          builder: (context, snaphot) {
                                            if (snaphot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            } else {
                                              return Text(
                                                allText[index + 1],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: allImages[index + 1] != ""
                            ? Image.network(allImages[index + 1],
                                fit: BoxFit.cover)
                            : null,
                      );
                    }),
              );
            }
          }),
    );
  }
}
