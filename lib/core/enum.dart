enum ScreenStates { init, loading, done, error, empty, notFound, success }

enum ParentsChosenNavigationItem {
  home,
  messages,
  notification,
  attendance,
  profile
}

enum TeacherChosenNavigationItem { home, messages, notification, qr, profile }

enum SelectedDayForSchedule { sun, mon, tue, wed, thu, fri, sat }

// ignore: constant_identifier_names
enum SelectedJobAppliedSection { Active, Rejected }

enum LoadingState { initial, loading, error, done }

enum FilePicking { choosing, error, done, initial }

enum VerificationMethod { sms, authenticator }
