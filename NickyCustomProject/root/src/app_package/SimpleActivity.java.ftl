package ${packageName};

import android.os.Bundle;
import ${packageName}.Application.BaseActivity;

<#if applicationPackage??>import ${applicationPackage}.R;</#if>

public class ${activityClass} extends BaseActivity
{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
    }


}
