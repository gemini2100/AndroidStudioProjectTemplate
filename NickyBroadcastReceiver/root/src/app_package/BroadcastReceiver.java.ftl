package ${packageName};

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class ${className} extends BroadcastReceiver 
{
    public ${className}() 
    {
    
    }

    @Override
    public void onReceive(Context context, Intent intent) 
    {
        // TODO: This method is called when the BroadcastReceiver is receiving
        // an Intent broadcast.
        throw new UnsupportedOperationException("Not yet implemented");
    }
}

// 广播接收器onReceive内不能开启线程也不能执行长时间的操作,比较好的方式是启动服务去完成任务.
// 本地接收器无法使用静态注册方式,但是高效安全.
////设置广播接收器
//private IntentFilter myIntentFilter= new IntentFilter("nickycom.www.lifecycletest.test");
//private MyReceiver myReceiver = new MyReceiver();
//
//    /*动态注册广播接收器*/
////onCreate函数中
////注册全局广播
//    registerReceiver(myReceiver,myIntentFilter);
////注册本地广播
//LocalBroadcastManager.getInstance(NormalActivity.this).registerReceiver(myReceiver, myIntentFilter);
//
////onDestroy函数中
////反注册全局广播
//        unregisterReceiver(myReceiver);
////反注册局部广播
//        LocalBroadcastManager.getInstance(NormalActivity.this).unregisterReceiver(myReceiver);
//
///*静态注册广播接收器*/
//<receiver android:name=".MyReceiver_Boot" android:exported="false">
//<intent-filter>
//<action android:name="nickycom.www.lifecycletest.test"></action>
//</intent-filter>
//</receiver>
//
//
///*发送广播*/
//        Intent intent = new Intent("nickycom.www.lifecycletest.test");
////全局广播
//        sendBroadcast(intent);
////有序广播
//        sendOrderedBroadcast(intent,null);  <intent-filter android:priority="100"> abortBroadcast();//可以阻断广播再传送
////发送本地广播
//        LocalBroadcastManager.getInstance($Activity$.this).sendBroadcast(intent);

