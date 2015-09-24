package ${packageName}.Application;

/**
 * Created by Nicky on 2015/6/18
 */
 
public class BaseProfileString
{
    /*
    * 需要权限
    * <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    * <uses-permission android:name="android.permission.MOUNT_UNMOUNT_FILESYSTEMS" />
    * */


    /* 崩溃日记相关配置 */
    public static final String CrashFileFolder = "/${logFileName}/crash/";
    public static final String CrashFilePrefix = "${logFileName}Crash";
    public static final String CrashFileSuffix = ".log";

    /* tomcat 过滤标志配置 */
    public static final String LOGTAG = "${logFileName}";
    public static final String LOGFileFolder = "/${logFileName}/LOG/";
    public static final String LOGFile = "${logFileName}Log.txt";

    /* SharedPreferences配置文件名 */
    public final static String SharedPreferencesName = "SP_${logFileName}";
}