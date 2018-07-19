import java.util.List;

import com.aaa.dao.impl.UserDAOImpl;
import com.aaa.entity.UserLoginInfo;

public class SQLTest {

	public static void main(String[] args) throws Exception {
		UserDAOImpl udp = new UserDAOImpl();
		List<UserLoginInfo> all =udp.selectUserLoginInfo();
		System.out.println(all);
	}

}
