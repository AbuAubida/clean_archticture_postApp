import 'package:flutter/material.dart';

class ErrorMessegeWidget extends StatelessWidget {
  final String messege;
  const ErrorMessegeWidget({super.key, required this.messege});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(messege,style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
        ),

      ),
      
    );
  }
}
