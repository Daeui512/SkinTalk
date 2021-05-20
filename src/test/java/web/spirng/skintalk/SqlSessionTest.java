package web.spirng.skintalk;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import web.spring.skintalk.domain.CartVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class SqlSessionTest {
	private static final Logger LOGGER = LoggerFactory.getLogger(SqlSessionTest.class);
	private static final String NAMESPACE = "web.spring.skintalk.CartMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void testInsert() {
		LOGGER.info("testInsert() 호출");
		CartVO vo = new CartVO(0, "test", null, 30, null, 0, 1, 0);
		int result = sqlSession.insert(NAMESPACE + ".insert", vo);
		if (result == 1) {
			LOGGER.info(result + "행 삽입");
		}
	}
}
