import 'package:flutter/material.dart';
import 'package:questoes_enem/models/questions.dart';

class AlternativeItemWidget extends StatefulWidget {
  const AlternativeItemWidget({super.key, required this.alternative});
  final Alternative alternative;

  @override
  State<AlternativeItemWidget> createState() => _AlternativeItemWidgetState();
}

class _AlternativeItemWidgetState extends State<AlternativeItemWidget> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = true;
        });
      },
      child: Card(
        color: _isSelected
            ? widget.alternative.isCorrect!
                ? Colors.green.shade100
                : Colors.red.shade100
            : null,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8.0,
            children: [
              Text(
                widget.alternative.letter!,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Flexible(child: Text(widget.alternative.text!)),
            ],
          ),
        ),
      ),
    );
  }
}
