enum NewsStatus { loading, success, error }

class NewsState {

  final NewsStatus status;
    
  NewsState({
    this.status = NewsStatus.loading,
  });

  NewsState.success() : status = NewsStatus.success;
  NewsState.error() : status = NewsStatus.error;
}