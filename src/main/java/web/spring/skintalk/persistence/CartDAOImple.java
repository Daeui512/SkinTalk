package web.spring.skintalk.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import web.spring.skintalk.domain.CartVO;

@Repository
public class CartDAOImple implements CartDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(CartDAOImple.class);
	private static final String NAMESPACE = "web.spring.skintalk.CartMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CartVO> cartMoney() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(CartVO vo) {
		logger.info("insert()");
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	@Override
	public List<CartVO> listCart(String userId) {
		logger.info("listCart() : userId = " + userId);
		return sqlSession.selectList(NAMESPACE + ".CartList", userId);
	}
	
	@Override
	public List<CartVO> nonMemberListCart(String nonMemberUserId){
		logger.info("nonMemberListCart() : nonMemberUserId = " + nonMemberUserId);;
		return sqlSession.selectList(NAMESPACE + ".nonMemberCartList", nonMemberUserId);
	}
	

	@Override
	public int delete(int cartNo) {
		logger.info("delete()");
		return sqlSession.delete(NAMESPACE + ".cartDeleteOne", cartNo);
	}

	@Override
	public int deleteAll(String userId) {
		logger.info("deleteAll() 호출 : userId" + userId);
		return sqlSession.delete(NAMESPACE + ".cartDeleteAll", userId);
	}

	@Override
	public int sumMoney(String userId) {
		logger.info("sumMoney()");
		return sqlSession.selectOne(NAMESPACE + ".sumMoney", userId);
	}

	@Override
	public int countCart(String userId) {
		logger.info("countCart()");
		return sqlSession.selectOne(NAMESPACE + ".countCart", userId);
	}

	@Override
	public int countCartOne(int cartNo) {
		logger.info("countCartOne()");
		return sqlSession.selectOne(NAMESPACE + ".countCartOne", cartNo);
	}

	@Override
	public int updateAllCart(CartVO vo) {
		logger.info("updateAllCart() 호출");
		return sqlSession.update(NAMESPACE + ".cartUpdateAll", vo);
	}

	@Override
	public int updateIncreaseCart(CartVO vo) {
		logger.info("updateCart()");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", 1);
		map.put("userId", vo.getUserId());
		map.put("amount", vo.getAmount());
		map.put("cartNo", vo.getCartNo());
		return sqlSession.update(NAMESPACE + ".cartUpdate", map);
	}

	@Override
	public int updateDecreaseCart(CartVO vo) {
		logger.info("updateCart()");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("count", -1);
		map.put("userId", vo.getUserId());
		map.put("amount", vo.getAmount());
		map.put("cartNo", vo.getCartNo());
		return sqlSession.update(NAMESPACE + ".cartUpdate", map);
	}
	
	@Override
    public int countCart(String userId, int productNo) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("productNo", productNo);
        map.put("userId", userId);
        logger.info("countCart()" + map);
        return sqlSession.selectOne(NAMESPACE + ".countInProduct" , map);  
    }
	
	@Override
	public void updateCart(CartVO vo) {
	    logger.info("updateCart()");
	    sqlSession.update(NAMESPACE + ".updateExistInCart", vo);
	}

	
	
	
}
