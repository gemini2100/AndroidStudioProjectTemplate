package ${packageName};

import android.animation.TypeEvaluator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;

/**
 * Created by Nicky on 15/10/17
 */
//使用下面布局文件到activity布局内
//<${packageName}.${viewClass}  
//        android:layout_width="match_parent"  
//        android:layout_height="match_parent" /> 
 
public class ${viewClass} extends View
{
    public static final float RADIUS = 50f;  
  
    private Point currentPoint;  
  
    private Paint mPaint; 

    public ${viewClass}(Context context,AttributeSet attrs)
    {
        super(context, attrs);

        mPaint = new Paint(Paint.ANTI_ALIAS_FLAG);  
        mPaint.setColor(Color.BLUE);
    }

    @Override  
    protected void onDraw(Canvas canvas) 
    {  
        if (currentPoint == null) 
        {  
            //如果currentPoint对象是空，那么就调用startAnimation()方法来启动动画
            currentPoint = new Point(RADIUS, RADIUS);  
            drawCircle(canvas);  
            startAnimation();  
        } 
        else 
        {  
            //如果currentPoint对象不等于空，那么就调用drawCircle()方法在currentPoint的坐标位置画出一个半径为50的圆
            drawCircle(canvas);  
        }  
    }  
  
    private void drawCircle(Canvas canvas) 
    {  
        float x = currentPoint.getX();  
        float y = currentPoint.getY();  
        canvas.drawCircle(x, y, RADIUS, mPaint);  
    }  
  
    private void startAnimation() 
    {  
        Point startPoint = new Point(RADIUS, RADIUS);  
        Point endPoint = new Point(getWidth() - RADIUS, getHeight() - RADIUS);  
        ValueAnimator anim = ValueAnimator.ofObject(new PointEvaluator(), startPoint, endPoint);  
        anim.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() 
        {  
            @Override  
            public void onAnimationUpdate(ValueAnimator animation) 
            {  
                //每当Point值有改变的时候都会回调onAnimationUpdate()方法。在这个方法当中，
                //我们对currentPoint对象进行了重新赋值，并调用了invalidate()方法，这样的
                //话onDraw()方法就会重新调用，并且由于currentPoint对象的坐标已经改变了，那
                //么绘制的位置也会改变，于是一个平移的动画效果也就实现了。
                currentPoint = (Point) animation.getAnimatedValue();  
                invalidate();  
            }  
        });  
        anim.setDuration(5000);  
        anim.start();  
    }

    public class Point 
    {  
        private float x;  
        private float y;  
  
        public Point(float x, float y)
        {  
            this.x = x;  
            this.y = y;
        }  
  
        public float getX() 
        {  
            return x;  
        }  
  
        public float getY() 
        {  
            return y;  
        }
    }

    //告知系统如何从初始对象过度到结束对象
    public class PointEvaluator implements TypeEvaluator
    {
        @Override  
        public Object evaluate(float fraction, Object startValue, Object endValue) 
        {  
            Point startPoint = (Point) startValue;  
            Point endPoint = (Point) endValue;  
            float x = startPoint.getX() + fraction * (endPoint.getX() - startPoint.getX());  
            float y = startPoint.getY() + fraction * (endPoint.getY() - startPoint.getY());  
            Point point = new Point(x, y);  
            return point;  
        }
    } 

}