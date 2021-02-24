import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class XetiaImageNetwork extends StatelessWidget {
  const XetiaImageNetwork({
    Key key,
    @required this.sourceImage,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  final String sourceImage;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      sourceImage,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: context.theme.primaryColorLight,
                valueColor:
                    AlwaysStoppedAnimation<Color>(context.theme.primaryColor),
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset("assets/svg/image_not_found.svg"),
        ),
      ),
      fit: boxFit,
    );
  }
}
