class GalleryExampleItem {
  GalleryExampleItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
  });

  final String id;
  final String resource;
  final bool isSvg;
}

List<String> imagesList = [
  'assets/images/product_details/mango.png',
  'assets/images/product_details/mango.png',
  'assets/images/product_details/mango.png',
  'assets/images/product_details/mango.png',
  'assets/images/product_details/mango.png',
];

// class GalleryExampleItemThumbnail extends StatelessWidget {
//   const GalleryExampleItemThumbnail({
//     Key? key,
//     required this.galleryExampleItem,
//     required this.onTap,
//   }) : super(key: key);

//   final GalleryExampleItem galleryExampleItem;

//   final GestureTapCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: kWhiteColor,
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Hero(
//           tag: galleryExampleItem.id,
//           child: Image.asset(galleryExampleItem.resource, height: 80.0),
//         ),
//       ),
//     );
//   }
// }

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  GalleryExampleItem(
    id: "tag1",
    resource: 'assets/images/product_details/mango.png',
  ),
  GalleryExampleItem(
    id: "tag2",
    resource: 'assets/images/product_details/mango.png',

    // isSvg: true,
  ),
  GalleryExampleItem(
    id: "tag3",
    resource: 'assets/images/product_details/mango.png',
  ),
  GalleryExampleItem(
    id: "tag4",
    resource: 'assets/images/product_details/mango.png',
  ),
  GalleryExampleItem(
    id: "tag5",
    resource: 'assets/images/product_details/mango.png',
  ),
  // GalleryExampleItem(
  //   id: "tag4",
  //   resource:
  //       'assets/campaigns/campaignDetails/myglamm/references/ref_img_4.png',
  // ),
];
