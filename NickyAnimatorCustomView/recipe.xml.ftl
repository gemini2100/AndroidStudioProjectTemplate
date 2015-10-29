<?xml version="1.0"?>
<recipe>

    <instantiate from="root/src/app_package/CustomView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${viewClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${viewClass}.java" />
    
</recipe>
