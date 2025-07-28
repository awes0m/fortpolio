class ContactState {
  final String name;
  final String email;
  final String message;
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const ContactState({
    this.name = '',
    this.email = '',
    this.message = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  ContactState copyWith({
    String? name,
    String? email,
    String? message,
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return ContactState(
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactState &&
        other.name == name &&
        other.email == email &&
        other.message == message &&
        other.isLoading == isLoading &&
        other.isSuccess == isSuccess &&
        other.error == error;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        message.hashCode ^
        isLoading.hashCode ^
        isSuccess.hashCode ^
        error.hashCode;
  }
}
