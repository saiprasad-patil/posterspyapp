import 'package:flutter/material.dart';
import 'package:posterspyapp/components/type_provider.dart';
import 'package:provider/provider.dart';

class PosterTypes extends StatelessWidget {
  const PosterTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: [
        PosterTypeLable(
          typeText: "All",
        ),
        PosterTypeLable(
          typeText: "Movies",
        ),
        PosterTypeLable(
          typeText: "Tv shows",
        ),
        PosterTypeLable(
          typeText: "Video games",
        ),
        PosterTypeLable(
          typeText: "Comics",
        ),
        PosterTypeLable(
          typeText: "Music",
        ),
        PosterTypeLable(
          typeText: "Staff picks",
        ),
      ],
    );
  }
}

class PosterTypeLable extends StatelessWidget {
  final String typeText;

  const PosterTypeLable({
    super.key,
    required this.typeText,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TypeProvider>(
      builder: (context, typeProviderModel, child) => TextButton(
        onPressed: () {
          typeProviderModel.toggle(typeText);
          typeProviderModel.setPageUrl(typeText);
        },
        child: Text(
          typeText,
          style: typeText == typeProviderModel.typeSelected
              ? Theme.of(context).textTheme.labelLarge
              : Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
