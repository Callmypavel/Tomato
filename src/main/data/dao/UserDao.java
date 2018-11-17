package data.dao;

import entity.Record;
import entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface UserDao {
    User login(@Param("accountName") String accountName, @Param("password")String password);
    Boolean checkExist(@Param("accountName") String accountName);
    Boolean register(@Param("userId") int userId, @Param("userName")String userName,@Param("accountName") String accountName, @Param("password")String password);
    ArrayList<Record> getRecords(@Param("preNumber") int preNumber, @Param("pageSize") int pageSize, @Param("userId") int userId);
    int getNumber(@Param("userId") int userId);
    void insertRecord(@Param("startTime") String startTime, @Param("endTime") String endTime, @Param("periodTime") String periodTime, @Param("number") int number, @Param("userId") int userId);
    int getDayRecordNumber(@Param("userId") int userId);
    int getSevenDaysRecordNumber(@Param("userId") int userId);
    int getThirtyDaysRecordNumber(@Param("userId") int userId);
    int getTotalRecordNumber(@Param("userId") int userId);
    int getTotalDays(@Param("userId") int userId);
}
