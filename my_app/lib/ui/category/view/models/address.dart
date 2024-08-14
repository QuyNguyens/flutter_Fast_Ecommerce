class Address{

  late String name;
  late String phone;
  late String addressLine1;
  late String district;
  late String city;
  late String local;
  late bool isDefault;
  late bool isSelected;

  Address(this.name, this.phone, this.addressLine1, this.district, this.city,
          this.local, this.isDefault, this.isSelected);

  static List<Address> addressList = <Address>[
    Address("Nguyễn Công Quý", "(+84 123456789)", "Số 11, Ca Văn Thỉnh", "Hải Châu", "Đà Nẵng", "Hòa Cường Bắc", true, true),
    Address("Thanh Phương", "(+84 124532424)", "Số 11, Ca Văn Thỉnh", "Hải Châu", "Đà Nẵng", "Hòa Cường Bắc", false, false),
    Address("Mai Đăng Lanh", "(+84 548756954)", "Số 11, Ca Văn Thỉnh", "Hải Châu", "Đà Nẵng", "Hòa Cường Bắc", false, false),
  ];
}