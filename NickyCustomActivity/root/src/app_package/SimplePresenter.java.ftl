package ${packageName}.activity_${activityClass};

import ${packageName}.Util.LogUtil;

/**
 * Created by Nicky on 2015/6/22
 */
public class ${activityClass}Presenter
{
    private I${activityClass}View  theView;
    private I${activityClass}Model theModel;
	
	
	public ${activityClass}Presenter(I${activityClass}View view)
    {
        this.theView = view;
        this.theModel = new ${activityClass}Model();
    }
	
	
	/* 获取Model数据，设置View */
	public void setViewValue()
    {
        try
        {
          //theView.setControlTitle(theModel.getControlTitle(theView.getContext()));
        }
        catch (Exception e)
        {
            LogUtil.toFile("${activityClass}Presenter setViewValue error:"+e.toString());
        }
    }
	
	
}
