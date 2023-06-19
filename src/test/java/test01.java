import com.coursedesign.dao.userDao;
import com.coursedesign.model.UserBean;
import org.junit.Test;

import java.util.ArrayList;


public class test01 {
    @Test
    public void findTest() {
        userDao userDao = new userDao();
        ArrayList<UserBean>list =userDao.findAll();
        for (int i=0;i< list.size();i++){
            System.out.println("第"+(i+1)+"条数据的username值为:"+list.get(i).getName());
        }
    }

    @Test
    public void insertTest() {
        userDao userDao =new userDao();
        UserBean user = new UserBean();
        user.setName("辰辰");
        user.setTelephone("123456789");
        user.setEmail("2sdf511@qq.com");
        user.setPassword("16156161");
        userDao.insert(user);
    }
}