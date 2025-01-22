import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/presentation/pages/posts_add_update_page.dart';

gettingDataMessege({required DataCondition condition,required  String messege,required BuildContext context}) {
  
  return  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(messege,style: TextStyle(color: Colors.white),),
      backgroundColor:condition==DataCondition.success? Colors.green:Colors.redAccent,

    ));
  
}
