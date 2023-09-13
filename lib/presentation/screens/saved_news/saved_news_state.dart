enum SavedNewsStatus { loading, success, error }

class SavedNewsState {

  final SavedNewsStatus status;
    
  SavedNewsState({
    this.status = SavedNewsStatus.loading,
  });

  SavedNewsState.success() : status = SavedNewsStatus.success;
  SavedNewsState.error() : status = SavedNewsStatus.error;
}