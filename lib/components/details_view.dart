import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class DetailsWidgets extends StatelessWidget {

  String title;
  String value;

  DetailsWidgets({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RichText(
          text: TextSpan(
            text: value,
            style: DetailsTextStyle,
            children: <TextSpan>[
              TextSpan(text: title == 'WIND' ? 'km/hr':'',
                  style: KDetailsSuffixTextStyle
              ),
            ],
          ),
        ),
        Text(title, style: KDetailsTitleTextStyle,),
      ],
    );
  }
}