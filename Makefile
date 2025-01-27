run:
	dart run build_runner build --delete-conflicting-outputs
fix:
	dart fix --apply
check:
	git ls-files -u | cut -f 2 | sort -u
get:
	flutter pub get
clean:
	flutter clean
	rm -r ios/Podfile.lock
	flutter pub get
	pod install --repo-update
slang: