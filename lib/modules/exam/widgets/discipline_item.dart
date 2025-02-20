import 'package:flutter/material.dart';

class DisciplineItemWidget extends Card {
  const DisciplineItemWidget({
    super.key,
    required this.disciplineTitle,
  });
  final String disciplineTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Filtro de disciplinas ainda não disponível')));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(disciplineTitle),
            ],
          ),
        ),
      ),
    );
  }
}
