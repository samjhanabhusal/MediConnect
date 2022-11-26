import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:luveen/common/widgets/custom_button.dart';
import 'package:luveen/constants/utils.dart';
import 'package:luveen/features/address/services/address_services.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import 'package:luveen/common/widgets/custom_textfield.dart';
import 'package:luveen/constants/global_variables.dart';
import 'package:luveen/providers/user_provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String referenceId = "";
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices = AddressServices();

  @override
  // void initState() {
  //   super.initState();
  //   paymentItems.add(
  //     PaymentItem(
  //       amount: widget.totalAmount,
  //       label: 'Total Amount',
  //       status: PaymentItemStatus.final_price,
  //     ),
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
    phoneController.dispose();
  }

  // void onApplePayResult(res) {
  //   if (Provider.of<UserProvider>(context, listen: false)
  //       .user
  //       .address
  //       .isEmpty) {
  //     addressServices.saveUserAddress(
  //         context: context, address: addressToBeUsed);
  //   }
  //   addressServices.placeOrder(
  //     context: context,
  //     address: addressToBeUsed,
  //     totalSum: double.parse(widget.totalAmount),
  //   );
  // }

  // void onGooglePayResult(res) {
  //   if (Provider.of<UserProvider>(context, listen: false)
  //       .user
  //       .address
  //       .isEmpty) {
  //     addressServices.saveUserAddress(
  //         context: context, address: addressToBeUsed);
  //   }
  //   addressServices.placeOrder(
  //     context: context,
  //     address: addressToBeUsed,
  //     totalSum: double.parse(widget.totalAmount),
  //   );
  // }

  // void payPressed(String addressFromProvider) {
  //   addressToBeUsed = "";

  //   bool isForm = flatBuildingController.text.isNotEmpty ||
  //       areaController.text.isNotEmpty ||
  //       pincodeController.text.isNotEmpty ||
  //       cityController.text.isNotEmpty;

  //   if (isForm) {
  //     if (_addressFormKey.currentState!.validate()) {
  //       addressToBeUsed =
  //           '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
  //     } else {
  //       throw Exception('Please enter all the values!');
  //     }
  //   } else if (addressFromProvider.isNotEmpty) {
  //     addressToBeUsed = addressFromProvider;
  //   } else {
  //     showSnackBar(context, 'ERROR');
  //   }
  // }
  getAmt() {
    return int.parse(widget.totalAmount) * 100; // Converting to paisa
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: 'Flat, House no, Building',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: areaController,
                      hintText: 'Area, Street',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: pincodeController,
                      hintText: 'Pincode',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: cityController,
                      hintText: 'Town/City',
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Phone Number',
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      onTap: () => payWithKhaltiInApp(address),
                      text: "Pay with Khalti",
                    ),
                    Text(referenceId)
                  ],
                ),
              ),
              // ApplePayButton(
              //   width: double.infinity,
              //   style: ApplePayButtonStyle.whiteOutline,
              //   type: ApplePayButtonType.buy,
              //   paymentConfigurationAsset: 'applepay.json',
              //   onPaymentResult: onApplePayResult,
              //   paymentItems: paymentItems,
              //   margin: const EdgeInsets.only(top: 15),
              //   height: 50,
              //   onPressed: () => payPressed(address),
              // ),
              // const SizedBox(height: 10),
              // GooglePayButton(
              //   onPressed: () => payPressed(address),
              //   paymentConfigurationAsset: 'gpay.json',
              //   onPaymentResult: onGooglePayResult,
              //   paymentItems: paymentItems,
              //   height: 50,
              //   style: GooglePayButtonStyle.black,
              //   type: GooglePayButtonType.buy,
              //   margin: const EdgeInsets.only(top: 15),
              //   loadingIndicator: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void payWithKhaltiInApp(String addressFromProvider) {
    addressToBeUsed = "";

    // onKhaltiPayResult;
    // paymentItems;
    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty ||
        phoneController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}- ${phoneController.text}';
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: getAmt(),
          productIdentity: "Product id",
          productName: "productName"),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
    );
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Payment Successful"),
            actions: [
              SimpleDialogOption(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    if (Provider.of<UserProvider>(context, listen: false)
                        .user
                        .address
                        .isEmpty) {
                      addressServices.saveUserAddress(
                          context: context, address: addressToBeUsed);
                    }
                    addressServices.placeOrder(
                      context: context,
                      address: addressToBeUsed,
                      totalSum: double.parse(widget.totalAmount),
                    );
                    referenceId = success.idx;
                  });
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }

  void onCancel() {
    debugPrint("Cancelled");
  }
}
