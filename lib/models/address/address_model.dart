class AddressModel {
  AddressModel({
    this.title = '',
    this.address = '',
    this.phone = '',
    this.defaultFlag = false,
  });

  String title;
  String phone;
  String address;
  bool defaultFlag;

  static List<AddressModel> myAddressesList = [
    AddressModel(
      title: 'Home',
      address:
          "C6/7, Vivina Co Op Hsg Ltd, Ma Rd, Andher(w)Mumbai, Maharashtra",
      phone: "+249 123456789",
      defaultFlag: true,
    ),
    AddressModel(
      title: 'Work',
      address:
          "C6/7, Vivina Co Op Hsg Ltd, Ma Rd, Andher(w)Mumbai, Maharashtra",
      phone: "+249 123456789",
      defaultFlag: false,
    ),
    AddressModel(
      title: 'Home 2',
      address:
          "C6/7, Vivina Co Op Hsg Ltd, Ma Rd, Andher(w)Mumbai, Maharashtra",
      phone: "+249 123456789",
      defaultFlag: false,
    ),
    AddressModel(
      title: 'Hoem 3',
      address:
          "C6/7, Vivina Co Op Hsg Ltd, Ma Rd, Andher(w)Mumbai, Maharashtra",
      phone: "+249 123456789",
      defaultFlag: false,
    ),
  ];
}
