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

late Weather data;

class _homeState extends State<home> {
  @override
  void initState() {
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather());
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: BlocBuilder<WeatherBloc, WeatherState>(
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
    );
  }
}
