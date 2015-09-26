package ${packageName}.activity_${activityClass};

import android.os.Bundle;
import android.content.Context;
import android.content.Intent;
import ${packageName}.R;
import ${packageName}.Application.BaseActivity;

public class ${activityClass}Activity extends BaseActivity implements I${activityClass}View 
{

    @Override
    protected void onCreate(Bundle savedInstanceState) 
	{
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
    }
	
	/* 实现I${activityClass}View接口*/
    @Override
    public Context getContext()
    {
        return this;
    }
	
	@Override
    public void startActivityWithFinish(Class<?> cls)
    {
        startActivity(cls);
        finish();
    }

    @Override
    public void startActivity(Class<?> cls)
    {
        Intent intent = new Intent();
        intent.setClass(this, cls);
        startActivity(intent);
    }
	
	@Override
    public void finish()
    {
        super.finish();
    }	
	

}

