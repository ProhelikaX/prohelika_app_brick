//local packages
export 'package:{{name.snakeCase()}}_domain/domain.dart';
export 'package:{{name.snakeCase()}}_infrastructure/infrastructure.dart';
export 'package:{{name.snakeCase()}}_application/application.dart';

//local libraries
export 'localization/app_localization.dart';
export 'routes/app_routes.dart';
export 'utils/size_utils.dart';
export 'utils/navigator_service.dart';
export 'utils/image_constant.dart';
export 'theme/app_decoration.dart';
export 'widgets/custom_image_view.dart';
export 'theme/custom_text_style.dart';
export 'theme/theme_helper.dart';
export 'utils/permission_manager.dart';
export 'utils/file_upload_helper.dart';
export 'utils/pref_utils.dart';

//third party packages
export 'package:flutter_bloc/flutter_bloc.dart';
