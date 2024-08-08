String getOperationDateNow(){
  var date = DateTime.now();
  var operationDate = '${date.day}/${date.month}/${date.year}';
  return operationDate;
}