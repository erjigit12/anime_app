import 'package:flutter/material.dart';

class IosBackButton extends StatelessWidget {
  const IosBackButton({
    super.key,
    required this.onPressed,
    this.borderWidth = 2.0,
  });

  final VoidCallback onPressed;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 35,
        height: 35,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).shadowColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
