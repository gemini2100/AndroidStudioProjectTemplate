package ${packageName}.Util;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Set;

import ${packageName}.Application.BaseProfileString;

/**
 * Created by Nicky on 2015/6/18.
 */
public class SharedPreferencesUtil
{
    private static SharedPreferencesUtil instance = null;
    private SharedPreferences sp;
    private SharedPreferences.Editor editor;

    public static synchronized SharedPreferencesUtil getInstance(Context context)
    {
        if (instance == null)
        {
            if (context!=null)
                instance = new SharedPreferencesUtil(context.getApplicationContext());
        }
        return instance;
    }

    private SharedPreferencesUtil(Context context)
    {
        sp = context.getSharedPreferences(BaseProfileString.SharedPreferencesName, Context.MODE_PRIVATE);
        editor = sp.edit();
    }

    public void putStringSet(String key, Set<String> value)
    {
        editor.putStringSet(key, value);
        editor.apply();
    }

    public Set<String> getStringSet(String key)
    {
        Set<String> str = sp.getStringSet(key, null);
        return str;
    }

    public void putString(String key, String value)
    {
        editor.putString(key, value);
        editor.apply();
    }

    public String getString(String key)
    {
        String str = sp.getString(key, "");
        return str;
    }

    public String getString(String key, String def)
    {
        String str = sp.getString(key, def);
        return str;
    }

    public void putBoolean(String key, boolean value)
    {
        editor.putBoolean(key, value);
        editor.apply();
    }

    public boolean getBoolean(String key)
    {
        boolean res = sp.getBoolean(key, false);
        return res;
    }

    public boolean getBoolean(String key, boolean def)
    {
        boolean res = sp.getBoolean(key, def);
        return res;
    }

    public Integer getInteger(String key)
    {
        Integer res = sp.getInt(key, 0);
        return res;
    }
	
	public Integer getInteger(String key,int defValue)
    {
        Integer res = sp.getInt(key, defValue);
        return res;
    }

    public void putInteger(String key, Integer value)
    {
        editor.putInt(key, value);
        editor.apply();
    }

    public boolean contains(String key)
    {
        return sp.contains(key);
    }
}
