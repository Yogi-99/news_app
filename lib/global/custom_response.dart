class CustomResponse<T> {
  T data;
  Status status;
  String message;

  CustomResponse.loading(this.message) : status = Status.LOADING;
  CustomResponse.completed(this.data) : status = Status.COMPLETED;
  CustomResponse.error(this.message) : status = Status.ERROR;
}

enum Status { LOADING, COMPLETED, ERROR }
