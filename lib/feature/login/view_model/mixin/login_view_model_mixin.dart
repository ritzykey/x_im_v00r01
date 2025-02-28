mixin LoginViewModelMixin {
  bool isLoading = false;

  void startLoading() {
    isLoading = true;
  }

  void stopLoading() {
    isLoading = false;
  }

  Future<void> performLogin(String username, String password) async {
    startLoading();
    try {
      // Add your login logic here
      await Future.delayed(Duration(seconds: 2)); // Simulate a network call
      print('Login successful');
    } catch (e) {
      print('Login failed: $e');
    } finally {
      stopLoading();
    }
  }
}