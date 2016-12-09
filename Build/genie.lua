solution "JsonStthm"
	location				(_ACTION)
	language				"C++"
	configurations			{ "Debug", "Release" }
	platforms				{ "x32", "x64" }
	objdir					("../Intermediate/".._ACTION)

	project "JsonStthm"
		uuid				"B25FFFB1-E839-4C5D-829D-4E8FB3CD7728"
		kind				"StaticLib"
		targetdir			"../Output/"

		files {
							"../Src/**.cpp",
							"../Src/**.h",
		}
		
		configuration		"Debug"
			targetsuffix	"_d"
			flags			{ "Symbols" }
			
		configuration		"Release"
			targetsuffix	""
			flags			{ "Optimize" }

	project "Tests"
		uuid				"9AAC7A85-2318-43DD-9771-99EC2F7D35DC"
		kind				"ConsoleApp"
		targetdir			"../Output/"
		
		links				{ "JsonStthm" }
		files {
							"../Tests-Src/**.cpp",
							"../Tests-Src/**.h",

							-- https://github.com/vivkin/gason
							"../Tests-Externals/gason/src/gason.cpp",
							"../Tests-Externals/gason/src/gason.h",

							-- https://github.com/hjiang/jsonxx
							--"../Tests-Externals/gason/src/gason.cpp",
							--"../Tests-Externals/gason/src/gason.h",
		}
		
		includedirs {
							"../Src/",
							"../Tests-Externals/gason/src/"
		}

		configuration		"Debug"
			targetsuffix	"_d"
			flags			{ "Symbols" }
			
		configuration		"Release"
			targetsuffix	""
			flags			{ "Optimize" }