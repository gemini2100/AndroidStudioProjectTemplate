package ${packageName};

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/**
 * Created by Nicky on 15/10/17.
 *  在Activity的类中加入如下代码:
 *       ${viewClass} fragment =  new ${viewClass}();
 *       FragmentManager fragmentManager = getFragmentManager();
 *       FragmentTransaction transaction = fragmentManager.beginTransaction();
 *       transaction.replace(R.id.xxx_layout,fragment);
 *		 //transaction.addToBackStack(null);//用来实现当本Fragment被替换掉后,按下back键,返回到上一个Fragment
 *       transaction.commit();
 * -------------------------------------------------------------------------------
 *
 * 在Activity的Layout布局中放置如下代码:
 *
 *    <FrameLayout
 *      android:id="@+id/xxx_layout"
 *     android:layout_width="match_parent"
 *     android:layout_height="match_parent" >
 *      <!-- 静态加注方法, 如果动态加载，只需要空白的FrameLayout -->
 *       <fragment
 *          android:id="@+id/theFragment"
 *         android:layout_width="match_parent"
 *        android:layout_height="match_parent"
 *       android:name="${packageName}.${view_class}"/>
 *   </FrameLayout>
 *
 */



/**
 * Created by Nicky on 15/10/19
 */

public class ${viewClass} extends Fragment
{
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
    {
        //本质上自定义的layout XML文件只是在自定义试图中展开而已,可以用代码创建子控件来代替layout xml文件,当然也就意味着可以直接onDraw控件想做的绘制.
        View view = inflater.inflate(R.layout.control_${view_class} ,container,false);
        return view;
    }
}