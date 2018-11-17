package service;

import entity.Record;
import entity.User;

import java.util.ArrayList;

public interface UserService {
    User login(String accountName, String password);
    Boolean register(String accountName,String userName,String password);
    ArrayList<Record> getRecords(int preNumber, int pageSize,int user_id);
    int getNumber(int user_id);
    void insertRecord(String start_time,String end_time,String period_time,int number,int user_id);
    int getDayRecordNumber(int userId);
    int getSevenDaysRecordNumber(int userId);
    int getThirtyDaysRecordNumber(int userId);
    int getTotalRecordNumber(int userId);
    int getTotalDays(int userId);
}
