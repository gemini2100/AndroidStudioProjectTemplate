package ${packageName}.activity_${activityClass};

import android.os.Bundle;
import android.content.Context;
import android.content.Intent;
import ${packageName}.R;
import ${packageName}.Application.BaseActivity;

public class ${activityClass}Activity extends BaseActivity implements I${activityClass}View 
{

    /* 控制器 */
    private ${activityClass}Presenter presenter;	
	
    @Override
    protected void onCreate(Bundle savedInstanceState) 
	{
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
		
		/* 设置控制器 */
        presenter = new ${activityClass}Presenter(this);

        /* 获取控件 */        
        //edt_password = (EditText) findViewById(R.id.edt_psw);

        /* 设置视图值 */
        setViewValue();
    }
	
	protected void setViewValue()
    {
        presenter.setViewValue();
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

