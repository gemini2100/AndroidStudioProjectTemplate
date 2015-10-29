package ${packageName};

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;


/*
* 使用方式如下:
*/

//    如果需要绑定服务需要在Activity实现回调接口和交互对象设置.
//    private ${className}.DownloadBinder downloadBinder;
//    private ServiceConnection conn = new ServiceConnection()
//    {
//        @Override
//        public void onServiceConnected(ComponentName componentName, IBinder iBinder)
//        {
//            downloadBinder = (${className}.DownloadBinder) iBinder;
//            LogUtil.d("onServiceConnected ComponentName:"+componentName.toShortString());
//        }
//
//        @Override
//        public void onServiceDisconnected(ComponentName componentName)
//        {
//            if (componentName!=null)
//                LogUtil.d("onServiceDisconnected ComponentName:"+componentName.toShortString());
//        }
//    };
//
//    //启动服务用法
//    Intent intent = new Intent(getContext(), ${className}.class);
//    intent.putExtra("test","valeTest");
//    startService(intent);//服务没有创建的时候会先调用onCreate()然后调用onStartCommand(),否则多次调用只会调用onStartCommand()
//
//    Intent intent = new Intent(getContext(), ${className}.class);
//    stopService(intent);//停止服务,多次启动一次停止即可。在服务内部stopSelf()也可以停止服务,服务不停止会一直在运行.
//		
//	  //绑定服务用法
//    Intent intent = new Intent(getContext(), ${className}.class);
//    bindService(intent,conn,BIND_AUTO_CREATE);//表示在活动和服务绑定后自动创建服务,这会使onCreate()方法被调用,onStartCommand()不会被调用,然后调用onBind().本方法多次调用不会再次执行任何操作也不会crash.
//
//    unbindService(conn);//多次掉用本方法会crash,只能调用一次.
//	  注意,startService()+bindService(),必须stopService()+unbindService()才能停止服务,否则会一直在后台运行.


public class ${className} extends Service 
{
		
	private DownloadBinder mbinder;
    
    public ${className}() 
    {
        mbinder = new DownloadBinder();
        LogUtil.d("${className} Construct!");
    }

    @Override
    public IBinder onBind(Intent intent)
    {
        LogUtil.d("${className} onBind");
        return mbinder;
    }

	//第一次创建服务时候被调用.
    @Override
    public void onCreate()
    {
        super.onCreate();
        //setForegroundService(...); //开启前台服务
        LogUtil.d("${className} onCreate");
    }

	//每次startService都会被调用.
    @Override
    public int onStartCommand(Intent intent, int flags, int startId)
    {
        String val = intent.getStringExtra("test");
        LogUtil.d("${className} onStartCommand with parma:"+val);
        return super.onStartCommand(intent,flags,startId);
    }

	//释放资源,比如设置的广播接收器
    @Override
    public void onDestroy()
    {
        LogUtil.d("${className} onDestroy");
        mbinder = null;
        super.onDestroy();
    }
    
    public class DownloadBinder extends Binder
    {
        public void startDownload()
        {
            LogUtil.d("start downloading...");
        }

        public int getProgress()
        {
            LogUtil.d("return progress value");
            return 90;
        }
    }
    
    //设置通知
    
    /*
    *    设置一个通知.在被启动的Activity构造函数里调用:
    *    NotificationManager nm = (NotificationManager)this.getSystemService(NOTIFICATION_SERVICE);
    *    nm.cancel(NotificationID);
    */
    final int theNotificationID =1021;
    private Notification buildNotification(Class<?> activityDispaly,int contentTextId,int NotificationID)
    {
        Notification nf = null;
        try
        {
            Intent notificationIntent = new Intent(this, activityDispaly);
            notificationIntent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_CANCEL_CURRENT);

            String ContentTitle = getString(R.string.app_name);
            String ContentText = getString(contentTextId);

            Notification notification = new Notification.Builder(this)
                    .setContentTitle(ContentTitle)
                    .setContentText(ContentText)
                    .setSmallIcon(R.mipmap.ic_launcher)
                    //.setLargeIcon(BitmapFactory.decodeResource(getResources(), R.drawable.i5)
                    .setWhen(System.currentTimeMillis())
                    .setAutoCancel(true)
                    .setContentIntent(pendingIntent)
                    .setDefaults(Notification.DEFAULT_ALL)
                    .build();

        }
        catch (Exception e)
        {
            LogUtil.toFile("background service set as foreground server error:" + e.toString());
        }
        finally
        {
            return nf;
        }
    }

    private void setNotify(Class<?> activityDispaly,int contentTextId,int NotificationID)
    {
        Notification nf = buildNotification(activityDispaly, contentTextId, NotificationID);
        if (nf!=null)
        {
            NotificationManager nm = (NotificationManager) this.getSystemService(NOTIFICATION_SERVICE);
            nm.notify(NotificationID, nf);
        }
        else
        {
            LogUtil.toFile("launch notify error.");
        }
    }

    private void setForegroundService(Class<?> activityDispaly,int contentTextId,int NotificationID)
    {
        Notification nf = buildNotification(activityDispaly, contentTextId, NotificationID);

        if (nf!=null)
        {
            startForeground(NotificationID, nf);
        }
        else
        {
            LogUtil.toFile("set foreground service error.");
        }
    }
}
