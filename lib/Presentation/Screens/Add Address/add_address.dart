import 'package:fahadbazar/Presentation/Components/appbar_inner.dart';
import 'package:fahadbazar/Presentation/Components/common_button.dart';
import 'package:fahadbazar/Presentation/Components/positioned_bitton.dart';
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/cart%20screen/components/cart_text.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:fahadbazar/logic/Controller/api/Address/address_controller.dart';
import 'package:fahadbazar/models/Address/address_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddAddress extends StatefulWidget {
  AddAddress({Key? key, required this.address, required this.status})
      : super(key: key);

  final Address address;
  final String status;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  void initState() {
    super.initState();
    prefillDeails();
  }

  final addressController = Get.put(AddressController());
  var _result;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _addressController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _stateController = TextEditingController();

  prefillDeails() async {
    setState(() {
      _result = widget.address.type;
      _nameController.text = widget.address.name!;
      _phoneController.text = widget.address.phone!;
      _mailController.text = widget.address.email!;
      _addressController.text = widget.address.address!;
      _landmarkController.text = widget.address.landmark!;
      _pincodeController.text = widget.address.pincode!;
      _cityController.text = widget.address.city!;
      _districtController.text = widget.address.district!;
      _stateController.text = widget.address.state!;
    });
    await addressController.setName(_nameController.text);
    await addressController.setPhone(_phoneController.text);
    await addressController.setEmail(_mailController.text);
    await addressController.setAddress(_addressController.text);
    await addressController.setLandmark(_landmarkController.text);
    await addressController.setPincode(_pincodeController.text);
    await addressController.setCity(_cityController.text);
    await addressController.setDistrict(_districtController.text);
    await addressController.setState(_stateController.text);
    await addressController.onClickRadioButton(_result);
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'Add new Address',
          visible: false,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: commonHorizontalPadding,
              child: ListView(
                children: [
                  CupertinoTextField(
                    controller: _nameController,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setName(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter Your Name',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    controller: _phoneController,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setPhone(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your phone number',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    controller: _mailController,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setEmail(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your mail',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    controller: _addressController,
                    maxLines: 5,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setAddress(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your address',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    controller: _landmarkController,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setLandmark(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your landmark',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    controller: _pincodeController,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setPincode(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your pincode',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    controller: _cityController,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setCity(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your city',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    controller: _districtController,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setDistrict(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your district',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    controller: _stateController,
                    decoration: textFieldDecoration(),
                    onChanged: (value) {
                      addressController.setState(value);
                    },
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter your state',
                    placeholderStyle: textFieldHintStyle(),
                    padding: textFieldPadding(),
                  ),
                  commonHeight3,
                  const SectionHeadText(
                    title: 'Address type',
                    tail: false,
                  ),
                  commonHeight2,
                  Row(
                    children: [
                      Flexible(
                        child: RadioListTile(
                            activeColor: textBlueColor,
                            title: const Text('Home'),
                            value: 'Home',
                            groupValue: _result,
                            onChanged: (value) {
                              setState(() {
                                _result = value;
                              });
                              addressController.onClickRadioButton(value);
                            }),
                      ),
                      Flexible(
                        child: RadioListTile(
                            activeColor: textBlueColor,
                            title: const Text('Work'),
                            value: 'Work',
                            groupValue: _result,
                            onChanged: (value) {
                              setState(() {
                                _result = value;
                              });
                              addressController.onClickRadioButton(value);
                            }),
                      ),
                      // addressRadioButton(0, 'Home', sw),
                      // addressRadioButton(1, 'Work', sw),
                    ],
                  ),
                  commonHeight5,
                  commonHeight5,
                  commonHeight5,
                ],
              ),
            ),
          ),
          PositionedButton(
            text: 'Save',
            sw: sw,
            check: 'addAddress',
            onPressed: () async {
              widget.status == 'add'
                  ? await addressController.createAddress()
                  : await addressController.updateAddress(widget.address.id!);
            },
          )
        ],
      ),
    );
  }

  Text radioText(double sw, String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 0.04 * sw,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  EdgeInsets textFieldPadding() =>
      EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h);

  BoxDecoration textFieldDecoration() {
    return BoxDecoration(
      color: textFieldColor,
      borderRadius: BorderRadius.circular(8),
    );
  }

  TextStyle textFieldHintStyle() {
    return TextStyle(
        color: CupertinoColors.placeholderText,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w200,
        fontSize: 14.sp);
  }

  Row addressRadioButton(int btnIndex, String title, double sw) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GetBuilder<AddressController>(
          builder: (_) => InkWell(
            onTap: () {
              addressController.onClickRadioButton(title);
            },
            child: Radio(
                activeColor: Colors.blue,
                value: title,
                groupValue: addressController.type,
                onChanged: (value) =>
                    addressController.onClickRadioButton(value)),
          ),
        ),
        radioText(sw, title)
      ],
    );
  }
}
