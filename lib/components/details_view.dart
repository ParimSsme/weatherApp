import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class DetailsWidgets extends StatelessWidget {

  String title;
  String value;

  DetailsWidgets({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    String detail = title == 'WIND' ? 'km/':'';
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RichText(
          text: TextSpan(
            text: value,
            style: DetailsTextStyle,
            children: <TextSpan>[
              TextSpan(text: title == 'WIND' ? 'km/hr':'', style: KDetailsSuffixTextStyle),
            ],
          ),
        ),
        Text(title, style: KDetailsTitleTextStyle,),
      ],
    );
  }
}