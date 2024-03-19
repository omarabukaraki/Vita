import 'package:flutter/material.dart';

class CoverPost extends StatelessWidget {
  const CoverPost({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width / 2.4,
      height: MediaQuery.of(context).size.width / 1.6,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(offset: Offset(0, 1), blurRadius: 4, color: Colors.black12)
      ], borderRadius: BorderRadius.circular(16)),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
