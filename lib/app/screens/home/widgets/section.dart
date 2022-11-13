import 'package:flutter/material.dart';
import 'package:fugi_fic_slicing_furniture/app/constants/colors.dart';

class Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const Section(
    this.title,
    this.children, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20.0, height: 1),
                ),
                InkWell(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      // Text(
                      //   'View all',
                      //   style: TextStyle(
                      //     fontSize: 18.0,
                      //     height: 1,
                      //     color: primaryColor,
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 10.0),
                      //   child: Icon(
                      //     Icons.arrow_forward,
                      //     color: primaryColor,
                      //   ),
                      // ),
                    ],
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Wrap(
                spacing: 28.0,
                children: children,
              ),
            ),
          ),
        )
      ],
    );
  }
}
