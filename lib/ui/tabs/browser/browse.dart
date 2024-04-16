import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/browser/browser_builder.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      //  ui of browse screen
      child: Padding(
        padding:
            EdgeInsetsDirectional.only(top: 70, start: 17, end: 33, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Browse Category ",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 19,
            ),
            Expanded(child: BrowderBuilder()),
          ],
        ),
      ),
    );
  }
}
