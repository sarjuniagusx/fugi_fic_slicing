import 'package:flutter/material.dart';
import 'package:fugi_fic_slicing_furniture/app/constants/colors.dart';

class PromoCard extends StatelessWidget {
  static final List<Color> bgColors = [primaryPromoColor, secondaryPromoColor];
  final String title;
  final String subtitle;
  final String caption;
  final String tag;
  final String imagePath;
  final String backgroundImagePath;
  final bool? reverseGradient;

  const PromoCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.backgroundImagePath,
    required this.tag,
    required this.caption,
    required this.imagePath,
    required this.reverseGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 250,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset.zero,
            blurRadius: 15.0,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: reverseGradient != null && reverseGradient!
              ? bgColors.reversed.toList()
              : bgColors,
        ),
        image: DecorationImage(
          image: AssetImage(backgroundImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (imagePath != null)
            Positioned(
              right: 0,
              bottom: 16.0,
              child: Image.asset(
                imagePath,
              ),
            ),
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  height: 1.5,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  height: 1.5,
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: tag != null
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      color: tagBackgroundColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        height: 1.5,
                      ),
                    ),
                  )
                : Text(
                    caption,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      height: 1.5,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
