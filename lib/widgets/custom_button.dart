import 'package:flutter/material.dart';
import 'package:meetly/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key,
  required this.text,
  required this.onPressed, required Color color, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: ElevatedButton(
      onPressed:onPressed,
       style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(
          double.infinity, 50
        ),
        
       ), 
      child: Text(text, style: const TextStyle(
        fontSize: 17,
        color: Colors.white,
         ),
       ),
       ),
    );
  }
}