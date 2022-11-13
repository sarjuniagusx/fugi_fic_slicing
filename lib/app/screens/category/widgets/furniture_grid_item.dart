import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fugi_fic_slicing_furniture/app/constants/colors.dart';
import 'package:fugi_fic_slicing_furniture/app/models/item.dart';

class FurnitureGridItem extends StatelessWidget {
  final Item item;
  final EdgeInsets margin;
  final Function() onTap;

  const FurnitureGridItem({
    Key? key,
    required this.item,
    required this.margin,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: margin == null ? EdgeInsets.zero : margin,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset.zero,
                blurRadius: 15.0,
              )
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(item.imagePath),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    Row(
                      children: [
                        Wrap(
                          spacing: 3,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              '${Item.format(item.originalPrice)}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: primaryColor,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: item.rating,
                                  minRating: 1,
                                  itemSize: 12,
                                  ignoreGestures: true,
                                  allowHalfRating: true,
                                  itemCount: 1,
                                  unratedColor: Colors.amber[100],
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    size: 2,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) => print(rating),
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  updateOnDrag: true,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '${item.rating}',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
