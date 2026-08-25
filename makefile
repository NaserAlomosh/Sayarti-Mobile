FLUTTER := fvm flutter
DART := fvm dart

setup:
	@echo "Run Flutter clean & pub get..."
	$(FLUTTER) clean && $(FLUTTER) pub get

	@echo "Activate and generate intl_utils..."
	$(FLUTTER) pub global activate intl_utils
	$(FLUTTER) pub global run intl_utils:generate

	@echo "Removing all generated .g.dart files..."
	find . -type f -name "*.g.dart" -delete

	@echo "Generating code..."
	$(DART) run build_runner build --delete-conflicting-outputs

build_g:
	@echo "Generating code..."
	$(DART) run build_runner build --delete-conflicting-outputs

translate_g:
# 	@echo "Run Flutter clean & pub get..."
# 	$(FLUTTER) clean && $(FLUTTER) pub get

	@echo "Activate and generate intl_utils..."
	$(FLUTTER) pub global activate intl_utils
	$(FLUTTER) pub global run intl_utils:generate