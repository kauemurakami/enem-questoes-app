import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.callback,
    required this.text,
    this.width,
  });
  final VoidCallback callback;
  final double? width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      height: 42.0,
      width: width ?? MediaQuery.sizeOf(context).width,
      child: MaterialButton(
        color: Colors.deepPurple,
        onPressed: callback,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
