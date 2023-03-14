import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({Key? key}) : super(key: key);

  final List<String> imagePaths = ['images/1.png', 'images/2.jpg'];
  final List<String> texts = ["แจ้งวิชาตกค้าง", "สืบค้นโครงงาน"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //loop images
          // for (String imagePath in imagePaths)
          for (int i = 0; i < imagePaths.length; i++)
            GestureDetector(
              onTap: () {
                // do something when tapped
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      imagePaths[i],
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      texts[i],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green[700]),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

// ระบบแจ้งซ่อมอุปกรณ์