package service.impl;

import data.dao.UserDao;
import entity.Record;
import entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;
import util.LogUtil;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
//    private SqlSessionFactory sqlSessionFactory;
//    public UserServiceImpl(){
//        try {
//            String resource = "data/mybatis-config.xml";
//            InputStream inputStream = Resources.getResourceAsStream(resource);
//            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//        }catch (Exception e){
//            e.printStackTrace();
//            System.out.println("mybatis初始化失败");
//        }
//    }

    @Override
    public User login(String accountName, String password) {
        return userDao.login(accountName,password);
    }

    @Override
    public Boolean register(String accountName, String userName, String password) {
        LogUtil.log(this,"确认注册元素"+accountName+userName+password);
        Boolean isExist = userDao.checkExist(accountName);
        if (isExist){
            System.out.println(accountName+"已存在");
            return null;
        }else {
            System.out.println(accountName+"卜存在");
            UUID uuid = UUID.randomUUID();
            return userDao.register(Math.abs(uuid.toString().hashCode()),userName,accountName,password);
        }
    }

    @Override
    public ArrayList<Record> getRecords(int preNumber,int pageSize,int user_id){
        ArrayList<Record> records = userDao.getRecords(preNumber, pageSize,user_id);
//            for (Record record : records){
//                LogUtil.log(this,"原来我是一个好人"+record.getEndTime());
//            }
        return records;
    }

    @Override
    public int getDayRecordNumber(int userId){
        return userDao.getDayRecordNumber(userId);
    }

    @Override
    public int getSevenDaysRecordNumber(int userId){
        return userDao.getSevenDaysRecordNumber(userId);
    }

    @Override
    public int getThirtyDaysRecordNumber(int userId){
        return userDao.getThirtyDaysRecordNumber(userId);
    }

    @Override
    public int getTotalRecordNumber( int userId){
        return userDao.getTotalRecordNumber(userId);
    }

    @Override
    public int getTotalDays(int userId){
        return userDao.getTotalDays(userId);
    }

    @Override
    public int getNumber(int user_id){
        return userDao.getNumber(user_id);
    }

    @Override
    public void insertRecord(String start_time,String end_time,String period_time,int number,int user_id) {
        userDao.insertRecord(start_time,end_time,period_time,number,user_id);
    }

}
