package com.jamwix;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

import haxe.Json;
import openfl.events.Event;

#if (android && openfl)
import openfl.utils.JNI;
#end


class JWHockeyApp {
	#if android
	private static var jwhockeyapp_init = 
		JNI.createStaticMethod("com.jamwix.JWHockeyApp", "initHockeyApp", "(Ljava/lang/String;)V");
	private static var jwhockeyapp_check_for_crashes =
		JNI.createStaticMethod("com.jamwix.JWHockeyApp", "checkForCrashes", "()V");
	#elseif ios
	private static var jwhockeyapp_init = Lib.load("jwhockeyapp", "jwhockeyapp_init", 1);
	#end

	private static var _initialized = false;

	public static function init(appId:String):Void 
	{
#if (ios || android)
		if (_initialized) return;
		jwhockeyapp_init(appId);
#end

		_initialized = true;

#if android
		checkForCrashes();
		openfl.Lib.current.stage.addEventListener(Event.ACTIVATE, checkForCrashes);
#end
	}

	public static function checkForCrashes(?e:Event):Void
	{
#if android
		if (_initialized) jwhockeyapp_check_for_crashes();
#end
	}
}
