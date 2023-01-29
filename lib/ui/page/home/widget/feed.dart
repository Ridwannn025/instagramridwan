import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controller/image/collection_controller.dart';
import '../../../../data/image/image.dart';
import 'feed_card.dart';

class FeedWidget extends StatefulWidget {
  final bool isCollection;
  const FeedWidget({
    Key? key,
    this.isCollection = false,
  }) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionController>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: _itemCount(value),
          itemBuilder: (context, index) => FeedCard(
            myImage: widget.isCollection
                ? value.myCollection[index]
                : value.myImages[index],
          ),
        );
      },
    );
  }

  int _itemCount(CollectionController value) {
    if (widget.isCollection) {
      return value.myCollection.length;
    } else {
      return value.myImages.length;
    }
  }
}
