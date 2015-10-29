<?xml version="1.0"?>
<recipe>
    
    <instantiate from="root/res/layout/sample.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/control_${view_class}.xml" />

    <instantiate from="root/src/app_package/CustomView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${viewClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${viewClass}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/control_${view_class}.xml" />
</recipe>
