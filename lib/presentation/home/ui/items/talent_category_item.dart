import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TalentCategoryItem extends StatelessWidget {
  TalentCategoryItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.type,
  });
  final String title;
  final String imageUrl;
  final String type;
  final GlobalKey backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: <Widget>[
              Flow(
                delegate: _ParallaxFlowDelegate(
                  scrollable: Scrollable.of(context),
                  listItemContext: context,
                  backgroundImageKey: backgroundImageKey,
                ),
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    key: backgroundImageKey,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (BuildContext context, String url,
                            DownloadProgress downloadProgress) =>
                        CircularProgressIndicator(
                            value: downloadProgress.progress),
                    errorWidget:
                        (BuildContext context, String url, Object error) =>
                            Image.asset(
                      'assets/images/img_default_avatar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const <double>[0.6, 0.95],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      type,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  _ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final RenderBox scrollableBox =
        scrollable.context.findRenderObject()! as RenderBox;
    final RenderBox listItemBox =
        listItemContext.findRenderObject()! as RenderBox;
    final Offset listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final double viewportDimension = scrollable.position.viewportDimension;
    final double scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    final Alignment verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    final Size backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject()! as RenderBox)
            .size;
    final Size listItemSize = context.size;
    final Rect childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(
          0.0,
          childRect.top,
        ),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(_ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
