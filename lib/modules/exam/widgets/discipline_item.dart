import 'package:flutter/material.dart';

class DisciplineItemWidget extends Card {
  const DisciplineItemWidget({
    super.key,
    required this.disciplineTitle,
  });
  final String disciplineTitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(disciplineTitle),
          ],
        ),
      ),
    );
  }
}
