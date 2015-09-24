package ${packageName}.Util;

import android.os.Environment;
import android.util.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import ${packageName}.Application.BaseProfileString;

/**
 * Created by Nicky on 2015/6/18.
 */
public class LogUtil
{
    public static final int VERBOSE = 1;
    public static final int DEBUG = 2;
    public static final int INFO = 3;
    public static final int WARN = 4;
    public static final int ERROR = 5;
    public static final int NOTHING = 6;

    /*
    * LEVEL = VERBOSE 打印出所有日志,开发阶段
    * LEVEL = WARN    只打印出警告级别以上的日志
    * LEVEL = NOTHING 不打印日志，发布阶段
    * */
    public static final int LEVEL = VERBOSE;

    public static void v(String msg)
    {
        if (LEVEL<=VERBOSE)
        {
            Log.v(BaseProfileString.LOGTAG, msg);
        }
    }

    public static void v(String tag ,String msg)
    {
        if (LEVEL<=VERBOSE)
        {
            Log.v(tag,msg);
        }
    }

    public static void d(String msg)
    {
        if (LEVEL<=DEBUG)
        {
            Log.d(BaseProfileString.LOGTAG, msg);
        }
    }

    public static void d(String tag ,String msg)
    {
        if (LEVEL<=DEBUG)
        {
            Log.d(tag, msg);
        }
    }

    public static void i(String msg)
    {
        if (LEVEL<=INFO)
        {
            Log.i(BaseProfileString.LOGTAG, msg);
        }
    }

    public static void i(String tag ,String msg)
    {
        if (LEVEL<=INFO)
        {
            Log.i(tag, msg);
        }
    }

    public static void w(String msg)
    {
        if (LEVEL<=WARN)
        {
            Log.w(BaseProfileString.LOGTAG, msg);
        }
    }

    public static void w(String tag ,String msg)
    {
        if (LEVEL<=WARN)
        {
            Log.w(tag, msg);
        }
    }

    public static void e(String msg)
    {
        if (LEVEL<=ERROR)
        {
            Log.e(BaseProfileString.LOGTAG, msg);
        }
    }

    public static void e(String tag ,String msg)
    {
        if (LEVEL<=ERROR)
        {
            Log.e(tag, msg);
        }
    }

    public static void e(String msg, Throwable tr)
    {
        if (LEVEL<=ERROR)
        {
            Log.e(BaseProfileString.LOGTAG, msg,tr);
        }
    }

    public static void e(String tag, String msg, Throwable tr)
    {
        if (LEVEL<=ERROR)
        {
            Log.e(tag,msg,tr);
        }
    }

    public static void toFile(String msg)
    {
        if (LEVEL<=VERBOSE)
        {
            try
            {
                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
                String time = formatter.format(new Date());
                StringBuilder sb = new StringBuilder(4);
                sb.append(time);
                sb.append(":");
                sb.append(msg);
                sb.append("\n");

                if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
                {
                    String path = Environment.getExternalStorageDirectory().getPath() + BaseProfileString.LOGFileFolder;
                    File dir = new File(path);
                    if (!dir.exists())
                    {
                        dir.mkdirs();
                    }
                    FileOutputStream fos = new FileOutputStream(path + BaseProfileString.LOGFile,true);
                    fos.write(sb.toString().getBytes());
                    fos.close();
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
                LogUtil.e("an error occured while writing file...", e);
            }
        }
    }

}
