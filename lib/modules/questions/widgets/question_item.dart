import 'package:flutter/material.dart';
import 'package:questoes_enem/models/questions.dart';

class QuestionItemWidget extends Card {
  const QuestionItemWidget({super.key, required this.question});
  final Question question;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  question.title!,
                  style: TextTheme.of(context).bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  question.discipline!,
                  style: TextTheme.of(context).labelSmall,
                ),
              ],
            ),
            Text(question.context ?? ''),
            question.files == null
                ? const SizedBox.shrink()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: question.files?.length,
                    itemBuilder: (context, index) => Image.network(question.files![index]),
                  ),
            const SizedBox(
              height: 8.0,
            ),
            question.alternativesIntroduction == null
                ? const SizedBox.shrink()
                : Text(
                    '${question.alternativesIntroduction!}:',
                    style: TextTheme.of(context).bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                  ),
            const SizedBox(
              height: 8.0,
            ),
            Text('Alternativas', style: TextTheme.of(context).bodyLarge!.copyWith(fontWeight: FontWeight.w600)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: question.alternatives?.length,
              itemBuilder: (context, index) => Card(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 8.0,
                    children: [
                      Text(
                        question.alternatives![index].letter!,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Flexible(child: Text(question.alternatives![index].text!)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
