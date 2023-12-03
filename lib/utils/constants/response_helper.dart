class ResponseHelper{
  int statusCode;
  String message;
  bool loading;

  ResponseHelper({
    this.loading=false,
    this.message='',
    this.statusCode=1000
  });


  ResponseHelper copyWith ({
    int? statusCode,
    String? message,
    bool? loading,
  })=>
  ResponseHelper(
    loading: loading??this.loading,
    message: message??this.message,
    statusCode: statusCode??this.statusCode);
}
