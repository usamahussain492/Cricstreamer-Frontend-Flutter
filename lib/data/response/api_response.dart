

import 'package:cricstreamer/data/response/status.dart';

class ApiResponse<T>{

  Status? status;
  dynamic data;
  String? message;

  ApiResponse(this.status,this.message,this.data);

  ApiResponse.isLoading(): status =  Status.LOADING;

  ApiResponse.notCalled(): status = Status.NOT_CALLED;

  ApiResponse.completed(this.data) : status = Status.COMPLETED ;

  ApiResponse.error(this.message) : status = Status.ERROR ;


  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data: $data" ;
  }



}

