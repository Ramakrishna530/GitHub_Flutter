enum ApiStatus {
  loading,
  completed,
  error,
}

class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = ApiStatus.loading;

  ApiResponse.completed(this.data) : status = ApiStatus.completed;

  ApiResponse.error(this.message) : status = ApiStatus.error;

  @override
  String toString() => "Status : $status \n Message : $message \n Data : $data";
}
