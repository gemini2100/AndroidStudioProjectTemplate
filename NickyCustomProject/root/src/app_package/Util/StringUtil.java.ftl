package ${packageName}.Util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Nicky on 2015/6/18.
 */
public class StringUtil
{

    /**
     * 截取时间字符串 返回年月日
     */
    public static String getSimpleDate(String dateString)
    {
        long date = Long.parseLong(dateString);
        Date data = new Date(date);
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
        return format.format(data);
    }

    /**
     * 截取时间字符串 返回年月日
     */
    public static String getSimpleDate(Long date)
    {
        Date data = new Date(date);
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
        return format.format(data);
    }

    /**
     * 返回日期格式“yyyy-MM-dd”
     */
    public static String getSimpleDate2(String dateString)
    {
        long date = Long.parseLong(dateString);
        Date data = new Date(date);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(data);
    }

    /**
     * 订单时间返回HH:MM
     *
     * @param dateString
     * @return
     */
    public static String getSimpleDateHHMM(String dateString)
    {
        long date = Long.parseLong(dateString);
        if (date == 0)
        {
            return "";
        } else
        {
            Date data = new Date(date);
            SimpleDateFormat format = new SimpleDateFormat("HH:mm");
            return format.format(data);
        }
    }

    /**
     * 返回日期格式“yyyy-MM-dd”
     */
    public static String getSimpleDate2(long date)
    {
        if (date == 0)
        {
            return "";
        } else
        {
            Date data = new Date(date);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            return format.format(data);
        }

    }

    /**
     * 返回日期格式“yyyy-MM-dd hh:mm”
     */
    public static String getSimpleDate3(long date)
    {
        if (date == 0)
        {
            return "";
        } else
        {
            Date data = new Date(date);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
            return format.format(data);
        }

    }
}
