import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DeviceImageWidget extends StatelessWidget {
  final String src;
  final double height;
  const DeviceImageWidget({Key? key, required this.src, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Container(
          padding: EdgeInsets.all(16),
          width: 100,
          height: 100,
          child: src.contains(".svg")
              ? SvgPicture.network(
                  src,
                  fit: BoxFit.fill,
                  placeholderBuilder: (BuildContext context) => SizedBox(
                      height: height,
                      width: height,
                      child: const ImagePlaceholder()),
                )
              : Image.network(
                  src,
                  fit: BoxFit.fill,
                )),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        gradient:
            const LinearGradient(colors: [Colors.grey, Colors.transparent]),
        child: Card(child: Container()));
  }
}
