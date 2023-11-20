import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled20/Repository/ModelClass/Weather.dart';

import '../Bloc/weather_bloc.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}
TextEditingController controller = TextEditingController();
late Weather data;

class _homeState extends State<home> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Column(
        children: [
          SizedBox(height: 100.h,),
          Container(color: Colors.white,
            child: TextFormField(
              style: TextStyle(color: Colors.black,
                fontSize: 35.20.sp,
                fontFamily: 'Barlow',
                fontWeight: FontWeight.w700,),
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 25.h,),
      GestureDetector(onTap:  () {
        BlocProvider.of<WeatherBloc>(context).add(
            FetchWeather(text: controller.text));
      },
        child: Container(
          width: 190.w,
          height: 80.h,
          decoration: ShapeDecoration(
            color: Color(0xFFF3F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: Center(
            child: Text(
              'Get',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.20.sp,
                fontFamily: 'Barlow',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
          SizedBox(height: 50.h,),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WeatherError) {
                return Text('error');
              }
              if (state is WeatherLoaded) {
                data = BlocProvider
                    .of<WeatherBloc>(context)
                    .Weather1;
                return Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 180.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 110.w),
                      child: Text(
                        data.location!.name.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42.sp,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 170.w),
                      child: Text(
                        data.location!.coordinates!.latitude.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.sp,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Text(
                     data.forecast!.items![0].date.toString() ,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.sp,
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Text(
                      data.forecast!.items![1].dateWithTimezone.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                );
              }
              else {
                return SizedBox();
              }
            }),
      ],
      ),
    );
  }
}
