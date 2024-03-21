part of 'notifications_bloc.dart';

sealed class NotificationsEvent {
  const NotificationsEvent();
}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;
  NotificationStatusChanged(this.status);
}

class NotificationsReceived extends NotificationsEvent {
  final PushMessage pushMessage;
  NotificationsReceived(this.pushMessage);
}
