<?xml version="1.0"?>
<recipe>
    
    <instantiate from="root/res/layout/sample.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/item_${camelCaseToUnderscore(adapterClass)}.xml" />
          
    <instantiate from="root/src/app_package/CustomView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${arrayType}.java" />
                   
    <instantiate from="root/src/app_package/CustomViewAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${adapterClass}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/item_${adapterClass}.xml" />
</recipe>
