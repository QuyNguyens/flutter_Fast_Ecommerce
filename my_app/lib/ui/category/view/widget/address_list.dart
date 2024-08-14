import 'package:flutter/material.dart';
import 'package:my_app/app.dart';
import 'package:my_app/ui/category/view/models/address.dart';

class AddressList extends StatefulWidget{

  final List<Address> addresss;
  const AddressList({super.key, required this.addresss});

  @override
  State<StatefulWidget> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList>{

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar( 
      title: const Text(
        "Chọn địa chỉ nhận hàng",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300]
          ),
          padding: const EdgeInsets.all(10),
          child: const Text("Địa chỉ"),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: Address.addressList.length,
            itemBuilder: (context, index) {
              final address = Address.addressList[index];
              return GestureDetector(
                onTap: () => {
                  Navigator.pop(context)
                },
                child: Row (
                  children: [
                     SizedBox(
                      width: 40,
                      child: Icon(Icons.radio_button_checked_outlined, color: address.isSelected ? App.seedColor : App.subPriceColor ,),),
                    Expanded(child: ListTile(
                      title: Text(address.name + "  " + address.phone),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(address.addressLine1),
                          Text('${address.local}, ${address.district}, ${address.city}'),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_box_outlined,
                                    color: address.isDefault ? App.seedColor : App.subPriceColor,
                                    size: 25,
                                ),
                                const SizedBox(width: 5,),
                                const Text("Set as Default")
                              ])
                            ),
                            const SizedBox(height: 5,),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[300],
                            )
                        ],
                      ),
                    )
                )]));
                  },
                ),
        ),
      ],
    ),
  );
}

}