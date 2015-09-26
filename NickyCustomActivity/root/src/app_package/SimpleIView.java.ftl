package ${packageName}.activity_${activityClass};

import android.content.Context;

/**
 * Created by Nicky on 2015/6/22
 */
public interface I${activityClass}View
{
    Context getContext();
	void finish();
    
    void startActivityWithFinish(Class<?> cls);
    void startActivity(Class<?> cls);
    
}
