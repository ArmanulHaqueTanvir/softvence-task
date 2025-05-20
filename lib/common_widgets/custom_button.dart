import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.imgs,
    this.width = double.infinity,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
    required this.title,
  }) : super(key: key);

  final Color bgColor, textColor;
  final VoidCallback? onTap;
  final String title;
  final String? imgs;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                const SizedBox(width: 8),
                imgs != null
                    ? Container(
                      height: 27,
                      width: 27,
                      child: Image.asset(
                        imgs!,
                        color: textColor,
                        fit: BoxFit.cover,
                      ),
                    )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
