import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fugi_fic_slicing_furniture/app/data/fake.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/category/widgets/filter_modal_bottom_sheet.dart';
import 'package:fugi_fic_slicing_furniture/app/screens/category/widgets/vertical_separator.dart';
import 'package:fugi_fic_slicing_furniture/app/widgets/cart.dart';
import 'action_button.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0.0, 10.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: SvgPicture.asset('assets/icons/back.svg'),
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                Container(
                  width: 60.0,
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    // spacing: 10.0,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        height: 18,
                      ),
                      // Cart(
                      //   numberOfItemsInCart: Fake.numberOfItemsInCart,
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButton(
                  title: 'Filter',
                  iconPath: 'assets/icons/controls.svg',
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  active: true,
                ),
                const VerticalSeparator(),
                ActionButton(
                  title: 'Sort',
                  iconPath: 'assets/icons/sort.svg',
                  onTap: () {},
                ),
                const VerticalSeparator(),
                ActionButton(
                  title: 'List',
                  iconPath: 'assets/icons/list.svg',
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return FilterModalBottomSheet();
        });
  }
}
