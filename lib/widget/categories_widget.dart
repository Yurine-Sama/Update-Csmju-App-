import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //loop images
          for (int i = 1; i < 8; i++)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/1.png',
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    "แจ้งวิชาตกค้าง",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.green[700]),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}

// ระบบแจ้งซ่อมอุปกรณ์