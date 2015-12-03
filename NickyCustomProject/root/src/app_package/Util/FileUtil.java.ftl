package ${packageName}.Util;

import android.content.Context;
import android.os.Environment;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Nicky on 2015/6/18.
 */
public class FileUtil
{

    /*
    *
    *  程序目录下文件---检查文件是否存在
    *  context  上下文
    *  filename 比如 "StaffHelperLog.txt"
    *  存在返回 true ,不存在返回 false
    * */
    public static boolean fileExist(Context context, String filename)
    {
        File file = context.getFileStreamPath(filename);
        if(file.exists())
        {
            return true;
        }
        return false;
    }
	
    /*
    *
    *  程序目录下文件---读取文件
    *  context  上下文
    *  filename 比如 "StaffHelperLog.txt"
    *  如果失败返回字符""
    * */
    public static String readPrivateFile(Context context,String filename)
    {
        String retString = "";
        FileInputStream fileIn = null;

        try
        {
            fileIn = context.openFileInput(filename);
            int length = fileIn.available();
            if (length>0)
            {
                byte [] buffer = new byte[length];
                fileIn.read(buffer);
                retString = new String(buffer,"UTF-8");
            }
        }
        catch (FileNotFoundException e)
        {
            LogUtil.d("Read Private File error : file not Found " + filename);
        }
        catch (IOException e)
        {
            LogUtil.d("Read Private File error:" + e.toString());
        }
        finally
        {
            if (fileIn != null)
            {
                try
                {
                    fileIn.close();
                }
                catch (IOException e)
                {
                    LogUtil.d("Read Private File error:" + e.toString());
                }
            }
            return retString;
        }
    }

    /*
    *
    *  程序目录下文件---写入文件内容
    *  context  上下文
    *  filename 比如 "StaffHelperLog.txt"
    *  content 待写入的数据
    *  flag 文件操作标志 Context.MODE_PRIVATE是覆盖写入, Context.MODE_APPEND 追加写入
    *  成功返回true,失败返回false
    * */
    public static boolean writePrivateFile(Context context,String filename,String content,int flag)
    {
        boolean ret = false;
        FileOutputStream fileOut = null;
        try
        {
            fileOut = context.openFileOutput(filename, flag);
            fileOut.write(content.getBytes("UTF-8"));
            fileOut.flush();
            ret = true;
        }
        catch (FileNotFoundException e)
        {
            LogUtil.d("Write Private File error: file not Found "+filename);
        }
        catch (IOException e)
        {
            LogUtil.d("Write Private File error:" + e.toString());
        }
        finally
        {
            if (fileOut != null)
            {
                try
                {
                    fileOut.close();
                }
                catch (IOException e)
                {
                    LogUtil.d("Write Private File error:" + e.toString());
                }
            }
            return ret;
        }
    }

    /*
    *
    *  程序目录下文件---清空文件内容,如果文件不存在就创建一个新的空白文件
    *  context  上下文
    *  filename 比如 "StaffHelperLog.txt"
    *  成功返回true,失败返回false
    * */
    public static boolean clearPrivateFile(Context context,String filename)
    {
        return writePrivateFile(context,filename,"",Context.MODE_PRIVATE);
    }

    /*
    *
    *  程序目录下文件---删除文件
    *  context  上下文
    *  filename 比如 "StaffHelperLog.txt"
    *  成功返回true,失败返回false
    * */
    public static boolean deletePrivateFile(Context context,String filename)
    {
        boolean ret = false;
        try
        {
            ret = context.deleteFile(filename);
        }
        catch (Exception e)
        {
            LogUtil.d("delete Private File error: " + e.toString());
        }
        finally
        {
            return ret;
        }
    }

	    /*
    *
    *  SD卡目录下文件---检查文件是否存在
    *  folder 比如 "/StaffHelperLog/LOG/"
    *  filename 比如 "StaffHelperLog.txt"
    *  存在返回 true ,不存在返回 false
    * */
    public static boolean sdFileExist(String folder, String filename)
    {
        File file = new File(folder , filename);
        if (file.exists())
        {
            return true;
        }
        return false;
    }

    /*
    *
    *  SD卡目录下文件---读取文件
    *  folder 比如 "/StaffHelperLog/LOG/"
    *  filename 比如 "StaffHelperLog.txt"
    *  如果失败返回字符""
    * */
    public static String readSDFile(String folder,String filename)
    {
        String retString = "";

        FileInputStream fileIn = null;
        try
        {
            if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
            {
                String path = Environment.getExternalStorageDirectory().getPath() + folder;
                String fullFileName = path + filename;
                fileIn = new FileInputStream(fullFileName);

                File dir = new File(path);
                if (dir.exists())
                {
                    int length = fileIn.available();
                    if (length>0)
                    {
                        byte [] buffer = new byte[length];
                        fileIn.read(buffer);
                        retString = new String(buffer,"UTF-8");
                    }
                }
            }
        }
        catch (FileNotFoundException e)
        {
            LogUtil.d("read SDFile error: Not Find file " + filename);
        }
        catch (IOException e)
        {
            LogUtil.d("read SDFile error: " + e.toString());
        }
        finally
        {
            if (fileIn != null)
            {
                try
                {
                    fileIn.close();
                }
                catch (IOException e)
                {
                    LogUtil.d("read SDFile error: " + e.toString());
                }
            }
            return retString;
        }
    }

    /*
    *
    *  SD卡目录下文件---写入文件内容
    *  folder 比如 "/StaffHelperLog/LOG/"
    *  filename 比如 "StaffHelperLog.txt"
    *  content 待写入的数据
    *  flag 文件操作标志 true 追加数据，false覆盖原内容
    *
    * */
    public static boolean writeSDFile(String folder,String filename,String content,boolean flag)
    {
        boolean ret = false;

        FileOutputStream fos = null;
        try
        {
            if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
            {
                String path = Environment.getExternalStorageDirectory().getPath() + folder;
                String fullFileName = path + filename;
                File dir = new File(path);
                if (!dir.exists())
                {
                    dir.mkdirs();
                }
                fos = new FileOutputStream(fullFileName,flag);
                fos.write(content.getBytes("UTF-8"));
                ret = true;
            }

        }
        catch (IOException e)
        {
            LogUtil.d("write SDFile error: " + e.toString());
        }
        finally
        {
            if (fos != null)
            {
                try
                {
                    fos.close();
                }
                catch (IOException e)
                {
                    LogUtil.d("write SDFile error: " + e.toString());
                }
            }
            return ret;
        }

    }

    /*
    *
    *  SD卡目录下文件---清空文件内,如果文件不存在就会创建一个新的空白文件
    *  folder 比如 "/StaffHelperLog/LOG/"
    *  filename 比如 "StaffHelperLog.txt"
    *  成功返回true,失败返回false
    * */
    public static boolean clearSDFile(String folder,String filename)
    {
        return writeSDFile(folder,filename,"",false);
    }

    /*
    *
    *  SD卡目录下文件---删除文件
    *  folder 比如 "/StaffHelperLog/LOG/"
    *  filename 比如 "StaffHelperLog.txt"
    *  成功返回true,失败返回false
    * */
    public static boolean deleteSDFile(String folder,String filename)
    {
        boolean ret = false;

        try
        {
            if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED))
            {
                String path = Environment.getExternalStorageDirectory().getPath() + folder;
                String fullFileName = path + filename;

                File dir = new File(fullFileName);
                if (dir.exists())
                {
                    ret =dir.delete();
                }
            }
        }
        catch (Exception e)
        {
            LogUtil.d("delete SDFile error: " + e.toString());
        }
        finally
        {
            return ret;
        }
    }
}


