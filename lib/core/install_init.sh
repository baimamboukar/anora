# flutter_gen:
#   output: lib/core/generator
#   line_length: 80
#   integrations:
#     flutter_svg: true
#   colors:
#     enabled: true
#     outputs:
#       class_name: AppColors
#     inputs:
#       - assets/color/colors.xml
# flutter:
#   generate: true
#   uses-material-design: true
#   assets:
#     - assets/icon/

#     - .env
flutter pub add build_runner --dev
flutter pub add injectable_generator --dev
flutter pub add json_serializable --dev
flutter pub add copy_with_extension_gen --dev
flutter pub add flutter_gen_runner --dev
flutter pub add retrofit_generator --dev

flutter pub add flutter_secure_storage
flutter pub add shared_preferences
flutter pub add retrofit
flutter pub add dio
flutter pub add internet_connection_checker
flutter pub add pretty_dio_logger
flutter pub add fluro
flutter pub add injectable
flutter pub add get_it
flutter pub add copy_with_extension
flutter pub add meta
flutter pub add dartz
flutter pub add firebase_analytics
flutter pub add firebase_crashlytics
flutter pub add firebase_core
flutter pub add firebase_remote_config
flutter pub add launch_review
flutter pub add flutter_easyloading
flutter pub add package_info_plus
flutter pub add version
flutter pub add flutter_dotenv
      