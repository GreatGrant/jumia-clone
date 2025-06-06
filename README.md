# jumia_clone

A new Flutter project.

## Getting Started

jumia_clone/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── api_constants.dart
│   │   │   ├── app_constants.dart
│   │   │   ├── storage_keys.dart
│   │   │   └── route_constants.dart
│   │   │
│   │   ├── errors/
│   │   │   ├── exceptions.dart
│   │   │   ├── failures.dart
│   │   │   └── error_handler.dart
│   │   │
│   │   ├── network/
│   │   │   ├── api_client.dart
│   │   │   ├── network_info.dart
│   │   │   ├── dio_client.dart
│   │   │   └── interceptors/
│   │   │       ├── auth_interceptor.dart
│   │   │       ├── logging_interceptor.dart
│   │   │       └── error_interceptor.dart
│   │   │
│   │   ├── storage/
│   │   │   ├── local_storage.dart
│   │   │   ├── secure_storage.dart
│   │   │   └── cache_manager.dart
│   │   │
│   │   ├── utils/
│   │   │   ├── extensions/
│   │   │   │   ├── string_extensions.dart
│   │   │   │   ├── datetime_extensions.dart
│   │   │   │   ├── context_extensions.dart
│   │   │   │   └── number_extensions.dart
│   │   │   │
│   │   │   ├── helpers/
│   │   │   │   ├── validator.dart
│   │   │   │   ├── formatter.dart
│   │   │   │   ├── debouncer.dart
│   │   │   │   └── image_helper.dart
│   │   │   │
│   │   │   ├── logger.dart
│   │   │   ├── device_info.dart
│   │   │   └── permissions.dart
│   │   │
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   ├── colors.dart
│   │   │   ├── text_styles.dart
│   │   │   ├── dimensions.dart
│   │   │   └── shadows.dart
│   │   │
│   │   ├── localization/
│   │   │   ├── app_localizations.dart
│   │   │   ├── l10n/
│   │   │   │   ├── app_en.arb
│   │   │   │   ├── app_fr.arb
│   │   │   │   └── app_ar.arb
│   │   │   └── locale_helper.dart
│   │   │
│   │   ├── routes/
│   │   │   ├── app_router.dart
│   │   │   ├── route_generator.dart
│   │   │   └── route_guards.dart
│   │   │
│   │   └── di/
│   │       ├── injection_container.dart
│   │       ├── modules/
│   │       │   ├── network_module.dart
│   │       │   ├── storage_module.dart
│   │       │   └── repository_module.dart
│   │       └── service_locator.dart
│   │
│   ├── features/
│   │   ├── authentication/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── auth_local_datasource.dart
│   │   │   │   │   └── auth_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   ├── user_model.dart
│   │   │   │   │   ├── login_request_model.dart
│   │   │   │   │   ├── login_response_model.dart
│   │   │   │   │   └── signup_request_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── auth_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── user.dart
│   │   │   │   │   └── auth_result.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── auth_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── login_usecase.dart
│   │   │   │       ├── signup_usecase.dart
│   │   │   │       ├── logout_usecase.dart
│   │   │   │       ├── forgot_password_usecase.dart
│   │   │   │       └── get_current_user_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── auth_bloc.dart
│   │   │       │   ├── auth_event.dart
│   │   │       │   └── auth_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   ├── login_page.dart
│   │   │       │   ├── signup_page.dart
│   │   │       │   ├── forgot_password_page.dart
│   │   │       │   └── profile_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── login_form.dart
│   │   │           ├── signup_form.dart
│   │   │           ├── social_login_buttons.dart
│   │   │           └── auth_text_field.dart
│   │   │
│   │   ├── home/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── home_local_datasource.dart
│   │   │   │   │   └── home_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   ├── banner_model.dart
│   │   │   │   │   ├── category_model.dart
│   │   │   │   │   ├── flash_sale_model.dart
│   │   │   │   │   └── home_response_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── home_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── banner.dart
│   │   │   │   │   ├── category.dart
│   │   │   │   │   ├── flash_sale.dart
│   │   │   │   │   └── home_data.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── home_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── get_home_data_usecase.dart
│   │   │   │       ├── get_banners_usecase.dart
│   │   │   │       ├── get_categories_usecase.dart
│   │   │   │       └── get_flash_sales_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── home_bloc.dart
│   │   │       │   ├── home_event.dart
│   │   │       │   └── home_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   └── home_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── banner_slider.dart
│   │   │           ├── category_grid.dart
│   │   │           ├── flash_sale_section.dart
│   │   │           ├── promotional_cards.dart
│   │   │           └── home_app_bar.dart
│   │   │
│   │   ├── products/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── product_local_datasource.dart
│   │   │   │   │   └── product_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   ├── product_model.dart
│   │   │   │   │   ├── product_detail_model.dart
│   │   │   │   │   ├── review_model.dart
│   │   │   │   │   ├── variant_model.dart
│   │   │   │   │   └── product_list_response_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── product_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── product.dart
│   │   │   │   │   ├── product_detail.dart
│   │   │   │   │   ├── review.dart
│   │   │   │   │   ├── variant.dart
│   │   │   │   │   └── filter_options.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── product_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── get_products_usecase.dart
│   │   │   │       ├── get_product_detail_usecase.dart
│   │   │   │       ├── search_products_usecase.dart
│   │   │   │       ├── filter_products_usecase.dart
│   │   │   │       └── get_product_reviews_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── product_list/
│   │   │       │   │   ├── product_list_bloc.dart
│   │   │       │   │   ├── product_list_event.dart
│   │   │       │   │   └── product_list_state.dart
│   │   │       │   │
│   │   │       │   ├── product_detail/
│   │   │       │   │   ├── product_detail_bloc.dart
│   │   │       │   │   ├── product_detail_event.dart
│   │   │       │   │   └── product_detail_state.dart
│   │   │       │   │
│   │   │       │   └── search/
│   │   │       │       ├── search_bloc.dart
│   │   │       │       ├── search_event.dart
│   │   │       │       └── search_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   ├── product_list_page.dart
│   │   │       │   ├── product_detail_page.dart
│   │   │       │   ├── search_page.dart
│   │   │       │   └── filter_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── product_card.dart
│   │   │           ├── product_grid.dart
│   │   │           ├── product_detail_info.dart
│   │   │           ├── product_images.dart
│   │   │           ├── review_section.dart
│   │   │           ├── search_bar.dart
│   │   │           └── filter_options.dart
│   │   │
│   │   ├── cart/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── cart_local_datasource.dart
│   │   │   │   │   └── cart_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   ├── cart_item_model.dart
│   │   │   │   │   ├── cart_model.dart
│   │   │   │   │   └── coupon_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── cart_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── cart_item.dart
│   │   │   │   │   ├── cart.dart
│   │   │   │   │   └── coupon.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── cart_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── add_to_cart_usecase.dart
│   │   │   │       ├── remove_from_cart_usecase.dart
│   │   │   │       ├── update_cart_item_usecase.dart
│   │   │   │       ├── clear_cart_usecase.dart
│   │   │   │       ├── get_cart_usecase.dart
│   │   │   │       └── apply_coupon_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── cart_bloc.dart
│   │   │       │   ├── cart_event.dart
│   │   │       │   └── cart_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   └── cart_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── cart_item_widget.dart
│   │   │           ├── cart_summary.dart
│   │   │           ├── coupon_section.dart
│   │   │           └── empty_cart_widget.dart
│   │   │
│   │   ├── checkout/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── checkout_local_datasource.dart
│   │   │   │   │   └── checkout_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   ├── address_model.dart
│   │   │   │   │   ├── payment_method_model.dart
│   │   │   │   │   ├── order_model.dart
│   │   │   │   │   └── checkout_response_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── checkout_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── address.dart
│   │   │   │   │   ├── payment_method.dart
│   │   │   │   │   ├── order.dart
│   │   │   │   │   └── checkout_summary.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── checkout_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── get_addresses_usecase.dart
│   │   │   │       ├── add_address_usecase.dart
│   │   │   │       ├── get_payment_methods_usecase.dart
│   │   │   │       ├── place_order_usecase.dart
│   │   │   │       └── calculate_total_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── checkout_bloc.dart
│   │   │       │   ├── checkout_event.dart
│   │   │       │   └── checkout_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   ├── checkout_page.dart
│   │   │       │   ├── address_selection_page.dart
│   │   │       │   ├── payment_page.dart
│   │   │       │   └── order_confirmation_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── address_card.dart
│   │   │           ├── payment_method_card.dart
│   │   │           ├── order_summary.dart
│   │   │           └── checkout_stepper.dart
│   │   │
│   │   ├── orders/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── orders_local_datasource.dart
│   │   │   │   │   └── orders_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   ├── order_model.dart
│   │   │   │   │   ├── order_item_model.dart
│   │   │   │   │   └── order_status_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── orders_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── order.dart
│   │   │   │   │   ├── order_item.dart
│   │   │   │   │   └── order_status.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── orders_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── get_orders_usecase.dart
│   │   │   │       ├── get_order_detail_usecase.dart
│   │   │   │       ├── cancel_order_usecase.dart
│   │   │   │       └── track_order_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── orders_bloc.dart
│   │   │       │   ├── orders_event.dart
│   │   │       │   └── orders_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   ├── orders_page.dart
│   │   │       │   ├── order_detail_page.dart
│   │   │       │   └── order_tracking_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── order_card.dart
│   │   │           ├── order_status_timeline.dart
│   │   │           └── order_actions.dart
│   │   │
│   │   ├── categories/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── category_local_datasource.dart
│   │   │   │   │   └── category_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   ├── category_model.dart
│   │   │   │   │   └── subcategory_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── category_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   ├── category.dart
│   │   │   │   │   └── subcategory.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── category_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── get_categories_usecase.dart
│   │   │   │       └── get_subcategories_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── category_bloc.dart
│   │   │       │   ├── category_event.dart
│   │   │       │   └── category_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   ├── categories_page.dart
│   │   │       │   └── category_products_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── category_tile.dart
│   │   │           ├── subcategory_list.dart
│   │   │           └── category_header.dart
│   │   │
│   │   ├── wishlist/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── wishlist_local_datasource.dart
│   │   │   │   │   └── wishlist_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   └── wishlist_item_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── wishlist_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   └── wishlist_item.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── wishlist_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── add_to_wishlist_usecase.dart
│   │   │   │       ├── remove_from_wishlist_usecase.dart
│   │   │   │       └── get_wishlist_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── wishlist_bloc.dart
│   │   │       │   ├── wishlist_event.dart
│   │   │       │   └── wishlist_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   └── wishlist_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── wishlist_item.dart
│   │   │           └── empty_wishlist.dart
│   │   │
│   │   ├── notifications/
│   │   │   ├── data/
│   │   │   │   ├── datasources/
│   │   │   │   │   ├── notification_local_datasource.dart
│   │   │   │   │   └── notification_remote_datasource.dart
│   │   │   │   │
│   │   │   │   ├── models/
│   │   │   │   │   └── notification_model.dart
│   │   │   │   │
│   │   │   │   └── repositories/
│   │   │   │       └── notification_repository_impl.dart
│   │   │   │
│   │   │   ├── domain/
│   │   │   │   ├── entities/
│   │   │   │   │   └── notification.dart
│   │   │   │   │
│   │   │   │   ├── repositories/
│   │   │   │   │   └── notification_repository.dart
│   │   │   │   │
│   │   │   │   └── usecases/
│   │   │   │       ├── get_notifications_usecase.dart
│   │   │   │       ├── mark_as_read_usecase.dart
│   │   │   │       └── clear_notifications_usecase.dart
│   │   │   │
│   │   │   └── presentation/
│   │   │       ├── bloc/
│   │   │       │   ├── notification_bloc.dart
│   │   │       │   ├── notification_event.dart
│   │   │       │   └── notification_state.dart
│   │   │       │
│   │   │       ├── pages/
│   │   │       │   └── notifications_page.dart
│   │   │       │
│   │   │       └── widgets/
│   │   │           ├── notification_item.dart
│   │   │           └── notification_badge.dart
│   │   │
│   │   └── settings/
│   │       ├── data/
│   │       │   ├── datasources/
│   │       │   │   ├── settings_local_datasource.dart
│   │       │   │   └── settings_remote_datasource.dart
│   │       │   │
│   │       │   ├── models/
│   │       │   │   └── settings_model.dart
│   │       │   │
│   │       │   └── repositories/
│   │       │       └── settings_repository_impl.dart
│   │       │
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   └── app_settings.dart
│   │       │   │
│   │       │   ├── repositories/
│   │       │   │   └── settings_repository.dart
│   │       │   │
│   │       │   └── usecases/
│   │       │       ├── get_settings_usecase.dart
│   │       │       ├── update_settings_usecase.dart
│   │       │       ├── change_language_usecase.dart
│   │       │       └── toggle_theme_usecase.dart
│   │       │
│   │       └── presentation/
│   │           ├── bloc/
│   │           │   ├── settings_bloc.dart
│   │           │   ├── settings_event.dart
│   │           │   └── settings_state.dart
│   │           │
│   │           ├── pages/
│   │           │   ├── settings_page.dart
│   │           │   ├── language_page.dart
│   │           │   └── theme_page.dart
│   │           │
│   │           └── widgets/
│   │               ├── settings_tile.dart
│   │               ├── language_selector.dart
│   │               └── theme_selector.dart
│   │
│   └── shared/
│       ├── widgets/
│       │   ├── buttons/
│       │   │   ├── primary_button.dart
│       │   │   ├── secondary_button.dart
│       │   │   ├── icon_button.dart
│       │   │   └── floating_action_button.dart
│       │   │
│       │   ├── inputs/
│       │   │   ├── custom_text_field.dart
│       │   │   ├── search_field.dart
│       │   │   ├── dropdown_field.dart
│       │   │   └── checkbox_field.dart
│       │   │
│       │   ├── cards/
│       │   │   ├── product_card.dart
│       │   │   ├── category_card.dart
│       │   │   ├── banner_card.dart
│       │   │   └── info_card.dart
│       │   │
│       │   ├── dialogs/
│       │   │   ├── loading_dialog.dart
│       │   │   ├── error_dialog.dart
│       │   │   ├── confirmation_dialog.dart
│       │   │   └── success_dialog.dart
│       │   │
│       │   ├── loaders/
│       │   │   ├── circular_loader.dart
│       │   │   ├── skeleton_loader.dart
│       │   │   ├── shimmer_loader.dart
│       │   │   └── page_loader.dart
│       │   │
│       │   ├── navigation/
│       │   │   ├── bottom_nav_bar.dart
│       │   │   ├── app_drawer.dart
│       │   │   ├── custom_