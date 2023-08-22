class CouponsModel {
  final String title;
  final String svgFrameUrl;
  final String couponDetail;
  final String vaildityDetail;
  final String savingUpto;
  final String percentOff;

  CouponsModel({
    this.couponDetail = '',
    this.savingUpto = '',
    this.svgFrameUrl = '',
    this.title = '',
    this.vaildityDetail = '',
    this.percentOff = '',
  });

  static List<CouponsModel> couponsList = [
    CouponsModel(
      title: '#TRLYOFF200',
      percentOff: '25% off',
      couponDetail:
          'Use this Code “ #TRLYOFF200 “ to get 25% off on next delivery',
      vaildityDetail: 'Valid till 2nd June 2023',
      svgFrameUrl: 'assets/images/coupons/green_frame.svg',
    ),
    CouponsModel(
      title: '#TRLYOFF200',
      percentOff: '25% off',
      couponDetail:
          'Use this Code “ #TRLYOFF200 “ to get 25% off on next delivery',
      vaildityDetail: 'Valid till 2nd June 2023',
      svgFrameUrl: 'assets/images/coupons/blue_frame.svg',
    ),
    CouponsModel(
      title: '#TRLYOFF200',
      percentOff: '25% off',
      couponDetail:
          'Use this Code “ #TRLYOFF200 “ to get 25% off on next delivery',
      vaildityDetail: 'Valid till 2nd June 2023',
      svgFrameUrl: 'assets/images/coupons/green_frame.svg',
    ),
    CouponsModel(
      title: '#TRLYOFF200',
      percentOff: '25% off',
      couponDetail:
          'Use this Code “ #TRLYOFF200 “ to get 25% off on next delivery',
      vaildityDetail: 'Valid till 2nd June 2023',
      svgFrameUrl: 'assets/images/coupons/blue_frame.svg',
    ),
    CouponsModel(
      title: '#TRLYOFF200',
      percentOff: '25% off',
      couponDetail:
          'Use this Code “ #TRLYOFF200 “ to get 25% off on next delivery',
      vaildityDetail: 'Valid till 2nd June 2023',
      svgFrameUrl: 'assets/images/coupons/sea_green_frame.svg',
    ),
    CouponsModel(
      title: '#TRLYOFF200',
      percentOff: '25% off',
      couponDetail:
          'Use this Code “ #TRLYOFF200 “ to get 25% off on next delivery',
      vaildityDetail: 'Valid till 2nd June 2023',
      svgFrameUrl: 'assets/images/coupons/blue_frame.svg',
    ),
  ];
}
