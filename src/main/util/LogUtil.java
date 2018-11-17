package util;

public class LogUtil {
    public static void log(Object object,String message){
        System.out.println(object.getClass().getSimpleName()+"---->"+message);
    }

}
