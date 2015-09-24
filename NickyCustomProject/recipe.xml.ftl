<?xml version="1.0"?> <recipe>

	<#if appCompat><dependency mavenUrl="com.android.support:appcompat-
	v7:19.+"/></#if>

	<merge  from="AndroidManifest.xml.ftl"
	to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

	<merge from="res/values/strings.xml.ftl"
	to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

	<merge from="res/values/dimens.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/values/dimens.xml" /> 
	
		<instantiate from="res/layout/activity_simple.xml.ftl"
		to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

		<instantiate from="src/app_package/SimpleActivity.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

		<instantiate from="src/app_package/Application/BaseProfileString.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Application/BaseProfileString.java" />
		
		<instantiate from="src/app_package/Application/BaseApplication.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Application/BaseApplication.java" />
		
		<instantiate from="src/app_package/Application/AppEngine.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Application/AppEngine.java" />
		
		<instantiate from="src/app_package/Application/BaseActivity.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Application/BaseActivity.java" />		

		<instantiate from="src/app_package/Util/CrashHandler.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Util/CrashHandler.java" />

		<instantiate from="src/app_package/Util/FileUtil.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Util/FileUtil.java" />

		<instantiate from="src/app_package/Util/LogUtil.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Util/LogUtil.java" />

		<instantiate from="src/app_package/Util/OtherUtil.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Util/OtherUtil.java" />
		
		<instantiate from="src/app_package/Util/SharedPreferencesUtil.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Util/SharedPreferencesUtil.java" />
		
		<instantiate from="src/app_package/Util/TimeUtil.java.ftl"
		to="${escapeXmlAttribute(srcOut)}/Util/TimeUtil.java" />
		
		<!-- open the layout file when done -->
		<open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

	</recipe>
