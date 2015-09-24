package ${packageName}.Application;

import android.app.Activity;
import android.app.Application;
import java.util.ArrayList;
import java.util.List;

import ${packageName}.Util.CrashHandler;
import ${packageName}.Util.LogUtil;

/**
 * Created by Nicky on 2015/6/18
 */
public class BaseApplication extends Application
{
    public static List<Activity> activities = new ArrayList<>();

    @Override
    public void onCreate()
    {
        super.onCreate();
        CrashHandler.getInstance(this);
    }


    @Override
    public void onLowMemory()
    {
        super.onLowMemory();
        System.gc();
    }

    public static void addActivity(Activity activity)
    {
        activities.add(activity);
    }

    public static void removeActivity(Activity activity)
    {
        activities.remove(activity);
    }

    public static void finishAll()
    {
        try
        {
            for (Activity activity : activities)
            {
                if (activity != null)
                {
                    if (!activity.isFinishing())
                    {
                        activity.finish();
                    }
                }
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            System.exit(0);
        }

    }

    public static void printActivityStack()
    {
        StringBuilder sb = new StringBuilder();
        sb.append("\n");
        sb.append("--Bottom of activity stack-- \n");
        for (Activity activity : activities)
        {
            sb.append(activity.getClass().getSimpleName());
            sb.append("\n");
        }

        sb.append("--Top of activity stack--\n");
        LogUtil.d(sb.toString());
    }

}
