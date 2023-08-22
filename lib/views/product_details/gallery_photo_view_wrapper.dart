import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:influencer_app/screens/campaignDetails/view/gallery_example_item.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../widgets/common/custom_bottom_button.dart';
import 'gallery_example_item.dart';

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    super.key,
    this.loadingBuilder,
    // this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    // required this.galleryItems,
    this.imagesList = const [],
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  // final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> imagesList;
  // final List<GalleryExampleItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: mediaQuery.width * 0.04,
              right: mediaQuery.width * 0.04,
            ),
            decoration: BoxDecoration(color: Colors.red),
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: _buildItem,
                  itemCount: imagesList.length,
                  loadingBuilder: widget.loadingBuilder,
                  backgroundDecoration: BoxDecoration(color: Colors.blue),
                  pageController: widget.pageController,
                  onPageChanged: onPageChanged,
                  scrollDirection: widget.scrollDirection,
                ),
                // Container(
                //   // color: kWhiteColor,
                //   padding: const EdgeInsets.all(20.0),
                //   child: Text(
                //     "Image ${currentIndex + 1}",
                //     style: const TextStyle(
                //       color: Colors.white,
                //       fontSize: 17.0,
                //       decoration: null,
                //     ),
                //   ),
                // )
              ],
            ),
          ),

          //Custom Button View Cart

          Positioned(
            bottom: mediaQuery.height / 2,
            left: 10,
            // right: 0,
            child: GestureDetector(
                onTap: () {
                  if (currentIndex >= 0 && currentIndex < imagesList.length) {
                    currentIndex--;

                    // setState(() {
                    // currentIndex++;
                    // build(context, currentIndex);
                    _buildItem(context, currentIndex);
                    // });
                    print('object');
                  }
                },
                child: Icon(Icons.back_hand)),
          ),
          Positioned(
            bottom: mediaQuery.height / 2,
            right: 10,
            // right: 0,
            child: GestureDetector(
                onTap: () {
                  if (currentIndex >= 0 && currentIndex < imagesList.length) {
                    currentIndex++;

                    // setState(() {
                    // currentIndex++;
                    // build(context, currentIndex);
                    _buildItem(context, currentIndex);
                    // });
                    print('object');
                  }
                },
                child: Icon(Icons.back_hand)),
          ),

          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: CustomBottomButton(
              imgUrl: 'assets/images/product_details/view_cart.png',
              title: 'View Cart',
            ),
          ),
        ],
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final item = widget.imagesList[index];
    // final GalleryExampleItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(item),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      // heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }
}
