import 'package:flutter/material.dart';
import 'package:rentitezy/my_bookings/appbar_widget.dart';
import 'package:rentitezy/my_bookings/booking_model.dart';
import 'package:rentitezy/utils/const/widgets.dart';

import '../../theme/custom_theme.dart';

class BookingDetailsPage extends StatelessWidget {
  final MyBookingModelData bookingModelData;

  const BookingDetailsPage({super.key, required this.bookingModelData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBooking(
          'Booking Details  ( Flat no. ${bookingModelData.propUnit?.flatNo} )',
          context,
          false,
          (() {})),
      floatingActionButton:ElevatedButton(
        child: Text('Invoice'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CustomTheme.appTheme),

        ),
        onPressed: (){}) ,


      body: Container(
        width: getScreenWidth,
        height: getScreenHeight,
        padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth * 0.035,
            vertical: getScreenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getPropInfoView(context: context),
            SizedBox(
              height: getScreenHeight*0.02,
            ),
            Divider(),
            SizedBox(
              height: getScreenHeight*0.01,
            ),
            Text('Financial Info',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
            SizedBox(
              height: getScreenHeight*0.01,
            ),
            getPropPaymentView(context: context),
            SizedBox(
              height: getScreenHeight*0.02,
            ),
            Divider(),
            SizedBox(
              height: getScreenHeight*0.01,
            ),
            Text('User Info',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
            SizedBox(
              height: getScreenHeight*0.01,
            ),
            getPropUserView(context: context),
            SizedBox(
              height: getScreenHeight*0.02,
            ),
            Divider(),
            SizedBox(
              height: getScreenHeight*0.01,
            ),
            Text('Booking Info',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
            SizedBox(
              height: getScreenHeight*0.01,
            ),
            getPropBookingView(context: context),
          ],
        ),
      ),
    );
  }

  Widget getPropInfoView({required BuildContext context}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: getScreenHeight*0.15,
                width: getScreenWidth*0.25,

                child: Image.network(bookingModelData.propUnit?.listing?.images !=
                            null &&
                        bookingModelData.propUnit?.listing?.images!.length != 0
                    ? bookingModelData.propUnit?.listing?.images![0].url ?? ''
                    : '')),
          ),
          SizedBox(width: getScreenWidth*0.03,),
          Container(

            width: getScreenWidth*0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Icon(Icons.house,size: getScreenWidth*0.05,color: Colors.grey,),
                    SizedBox(width: getScreenWidth*0.01,),
                    Text('${bookingModelData.propUnit?.listing?.property?.name ?? ''}',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(height: getScreenHeight*0.005,),
                Row(
                  children: [
                    Icon(Icons.home_max,size: getScreenWidth*0.05,color: Colors.grey,),
                    SizedBox(width: getScreenWidth*0.01,),
                    Text('Flat no. ',style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.w600),),
                    Text(bookingModelData.propUnit?.flatNo ?? '',style: TextStyle(color: Colors.black54,fontSize: 18,fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(height: getScreenHeight*0.005,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on,size: getScreenWidth*0.05,color: Colors.grey,),
                    SizedBox(width: getScreenWidth*0.01,),
                    Container(

                        width: getScreenWidth*0.58,
                        child: Text('${bookingModelData.propUnit?.listing?.property?.address ?? ''}',style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),)),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getPropPaymentView({required BuildContext context}) {
    return Container(


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            children: [
              Text('Rent',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.18,),
              Text('₹ ${bookingModelData.rent ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: getScreenHeight*0.005,),
          Row(
            children: [
              Text('Deposit',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.13,),
              Text('₹ ${bookingModelData.deposit ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: getScreenHeight*0.005,),
          Row(
            children: [
              Text('Onboarding',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.07,),
              Text('₹ ${bookingModelData.onboarding ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: getScreenHeight*0.005,),
          Row(
            children: [
              Text('Amount Paid',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.05,),
              Text('₹ ${bookingModelData.amountPaid ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),

        ],
      ),
    );
  }

  Widget getPropUserView({required BuildContext context}) {
    return Container(


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            children: [
              Text('Name',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.12,),
              Text('${bookingModelData.name ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: getScreenHeight*0.005,),
          Row(
            children: [
              Text('Email',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.12,),
              Text('${bookingModelData.email ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: getScreenHeight*0.005,),
          Row(
            children: [
              Text('Mobile',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.1,),
              Text('${bookingModelData.phone ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          )

        ],
      ),
    );
  }

  Widget getPropBookingView({required BuildContext context}) {
    return Container(


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Row(
            children: [
              Text('No. of Guest',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.07,),
              Text('${bookingModelData.guest ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: getScreenHeight*0.005,),
          Row(
            children: [
              Text('Move-In',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.14,),
              Text('${bookingModelData.moveIn ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),
          SizedBox(height: getScreenHeight*0.005,),
          Row(
            children: [
              Text('Move-Out',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
              SizedBox(width: getScreenWidth*0.115,),
              Text('${bookingModelData.moveOut ?? ''}',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),


        ],
      ),
    );
  }
}
