// ignore_for_file: avoid_classes_with_only_static_members

abstract final class Endpoints {
  static const baseUrlAuth = "https://ubs-auth-api-dev.piton.com.tr/api/";

  static String getTaskDetail({required String id}) => "${baseUrlAuth}task-management/tasks/$id";
  static const getFileCategories = "${baseUrlAuth}file-categories";
}
