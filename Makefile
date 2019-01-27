distribute:
	zip -r BastionOfSanity.love assets lib src main.lua
	cat target/love.exe BastionOfSanity.love > target/BastionOfSanity.exe
	zip BastionOfSanity-win.zip target/*

