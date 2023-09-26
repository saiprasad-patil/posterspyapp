import 'package:flutter/material.dart';

class PosterTypes extends StatelessWidget {
  const PosterTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: [
        PosterTypeLable(
          typeText: "All",
          isSelected: true,
        ),
        PosterTypeLable(
          typeText: "Movies",
          isSelected: false,
        ),
        PosterTypeLable(
          typeText: "Tv shows",
          isSelected: false,
        ),
        PosterTypeLable(
          typeText: "Video games",
          isSelected: false,
        ),
        PosterTypeLable(
          typeText: "Comics",
          isSelected: false,
        ),
        PosterTypeLable(
          typeText: "Music",
          isSelected: false,
        ),
        PosterTypeLable(
          typeText: "Staff picks",
          isSelected: false,
        ),
      ],
    );
  }
}

class PosterTypeLable extends StatelessWidget {
  final String typeText;
  final bool isSelected;
  const PosterTypeLable({
    super.key,
    required this.typeText,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        typeText,
        style: isSelected
            ? Theme.of(context).textTheme.labelLarge
            : Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
