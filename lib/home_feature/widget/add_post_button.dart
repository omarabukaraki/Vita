import 'package:flutter/material.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({
    this.onTap,
    super.key,
  });
  final void Function()? onTap;
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
      child: Stack(
        alignment: const Alignment(0, 0.6),
        children: [
          Column(children: [
            Expanded(
                flex: 3,
                child: Image.asset(
                  'assets/images/my_plan2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              color: const Color(0xfffcfcfc),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Posts',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ))
          ]),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 64, 189, 135),
              ),
              child: const Center(
                  child: Icon(
                Icons.add,
                color: Colors.white,
                size: 28,
              )),
            ),
          )
        ],
      ),
    );
  }
}
