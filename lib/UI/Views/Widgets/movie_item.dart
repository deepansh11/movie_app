import 'package:flutter/material.dart';
import 'package:movie_app/UI/Views/moviel_details.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.desc,
  });
  final String name;
  final String imageUrl;
  final String desc;

  final GlobalKey backgroundGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Flow(
                  delegate: _ParallaxEffect(
                    backgroundGlobalKey: backgroundGlobalKey,
                    flowContext: context,
                    scrollableState: Scrollable.of(context),
                  ),
                  children: [
                    Image.network(
                      imageUrl,
                      width: double.infinity,
                      key: backgroundGlobalKey,
                      fit: BoxFit.cover,
                    ),
                  ]),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.6,
                        0.95,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      desc,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ParallaxEffect extends FlowDelegate {
  final ScrollableState scrollableState;
  final BuildContext flowContext;
  final GlobalKey backgroundGlobalKey;

  _ParallaxEffect(
      {required this.scrollableState,
      required this.flowContext,
      required this.backgroundGlobalKey})
      : super(repaint: scrollableState.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    //Calculate the position of the list time within the viewport

    final scrollBox = scrollableState.context.findRenderObject() as RenderBox;
    final listItemBox = flowContext.findRenderObject() as RenderBox;
    final listItemOffSet = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollBox);

    //Determine the percent position of the list item within the scrollable area

    final viewPort = scrollableState.position.viewportDimension;

    final scrollFraction = (listItemOffSet.dy / viewPort).clamp(0.0, 1.0);

    //Calculate the vertical alignment of the background based on the scrollable percentage

    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    //Conver the background alignment into a pixel offset for painting purposes

    final backgroundSize =
        (backgroundGlobalKey.currentContext?.findRenderObject() as RenderBox)
            .size;

    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    //Paint the background
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
  bool shouldRepaint(covariant _ParallaxEffect oldDelegate) {
    return scrollableState != oldDelegate.scrollableState ||
        flowContext != oldDelegate.flowContext ||
        backgroundGlobalKey != oldDelegate.backgroundGlobalKey;
  }
}
