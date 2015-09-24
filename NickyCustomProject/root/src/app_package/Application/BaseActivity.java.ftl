package ${packageName}.Application;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.KeyEvent;
import ${packageName}.Util.LogUtil;
import ${packageName}.Util.OtherUtil;

/**
 * Created by Nicky on 2015/6/18
 */
public class BaseActivity extends Activity
{

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        LogUtil.d(getClass().getSimpleName() + " add to activity stack!");
        BaseApplication.addActivity(this);

        //是否取消actionbar
        //requestWindowFeature(Window.FEATURE_NO_TITLE);
    }

    @Override
    protected void onDestroy()
    {
        BaseApplication.removeActivity(this);
        LogUtil.d(getClass().getSimpleName() + " remove from activity stack!");
        
        super.onDestroy();
    }

    public Context getContext()
    {
        return this;
    }


    /* 连续按back按键2次退出应用 */

		protected boolean backTwiceExit = true;
    private long lastBackTime = 0;
    private long currentBackTime = 0;
    
    protected void disableTwiceBackExit()
    {
        backTwiceExit = false;
    }
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        //捕获返回键按下的事件
        if(keyCode == KeyEvent.KEYCODE_BACK)
        {
            //是否是根界面
            if (isTaskRoot() && backTwiceExit)
            {
                currentBackTime = System.currentTimeMillis();
                //比较上次按下返回键和当前按下返回键的时间差，如果大于2秒，则提示再按一次退出
                if (currentBackTime - lastBackTime > 2 * 1000)
                {
                    OtherUtil.showToast(this, "再按一次返回键退出程序");
                    lastBackTime = currentBackTime;
                } else
                {
                    //如果两次按下的时间差小于2秒，则退出程序
                    BaseApplication.finishAll();
                }
                return true;
            }
        }
        return super.onKeyDown(keyCode, event);
    }

}
