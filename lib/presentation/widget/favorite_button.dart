
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoriteButton extends StatefulWidget {
   bool? isFavorite;
   FavoriteButton({
    Key? key,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.5.h, right: 3.2.w),
      child: InkWell(
        onTap: () {
          setState(() {
                    // if isFavorite false make it true or reverse
            widget.isFavorite = !widget.isFavorite!;
          });
        },
        child: widget.isFavorite!
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border_outlined,
                color: Colors.grey,
              ),
      ),
    );
  }
}
