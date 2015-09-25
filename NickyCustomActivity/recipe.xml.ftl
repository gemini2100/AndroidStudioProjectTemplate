<?xml version="1.0"?>
<recipe>

    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

    <instantiate from="res/layout/activity_simple.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <instantiate from="src/app_package/SimpleIModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity_${activityClass}/I${activityClass}Model.java" />
				   
	<instantiate from="src/app_package/SimpleIView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity_${activityClass}/I${activityClass}View.java" />
				   
	<instantiate from="src/app_package/SimpleActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity_${activityClass}/${activityClass}Activity.java" />
				   	
	<instantiate from="src/app_package/SimpleModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity_${activityClass}/${activityClass}Model.java" />
				   
	<instantiate from="src/app_package/SimplePresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/activity_${activityClass}/${activityClass}Presenter.java" />    
	
</recipe>
