import 'package:flutter/material.dart';
import 'package:mkp_ecommerce/presentation/misc/methods.dart';

class TopAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const TopAppBar({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 40,
            color: Colors.grey.shade800,
          ),
        ),
        horizontalSpace(20),
        SizedBox(
          // Minus 60 for the back button and 40 for the padding
          width: MediaQuery.of(context).size.width - 60 - 88,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
