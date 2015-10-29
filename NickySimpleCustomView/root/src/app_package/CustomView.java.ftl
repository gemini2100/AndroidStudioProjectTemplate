package ${packageName};

import android.app.Activity;
import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

/**
 * Created by Nicky on 15/10/17.
 *   使用方式:
 *   <${packageName}.${viewClass}
 *     android:layout_width="match_parent"
 *     android:layout_height="wrap_content">
 *   </${packageName}.${viewClass}>
 * 本质上自定义的layout XML文件只是在自定义试图中展开而已,可以用代码创建子控件来代替layout xml文件,当然也就意味着可以直接onDraw控件想做的绘制.
 */
 
public class ${viewClass} extends LinearLayout
{
    public ${viewClass}(Context context,AttributeSet attrs)
    {
        super(context, attrs);

        LayoutInflater.from(context).inflate(R.layout.control_${view_class},this);

        Button back = (Button) findViewById(R.id.example_back);
        back.setOnClickListener(new OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                ((Activity) getContext()).finish();
            }
        });
    }
}