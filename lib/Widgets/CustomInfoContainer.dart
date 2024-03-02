import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String pathName;
  final String partialText;
  final String fullText;

  const CustomContainer({
    super.key,
    required this.pathName,
    required this.partialText,
    required this.fullText,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height, w = MediaQuery.of(context).size.width;

    return Container(
      width: w * 0.9,
      color: Colors.blue.withOpacity(0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: AssetImage(widget.pathName),
            ),
          ),
          SizedBox(height: h*.02),
          Text(
            showFullText ? widget.fullText : widget.partialText,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: h*.03),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showFullText = !showFullText;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0a8144),
                elevation: 4,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(showFullText ? 'Read Less' : 'Read More', style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),),
            ),
          ),
          SizedBox(height: h*.03),
        ],
      ),
    );
  }
}
