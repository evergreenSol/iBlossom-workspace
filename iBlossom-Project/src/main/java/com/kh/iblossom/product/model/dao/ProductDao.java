package com.kh.iblossom.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.vo.Product;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Repository
public class ProductDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("productMapper.selectListCount");
	}


	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("productMapper.selectList", null, rowBounds);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.insert("productMapper.insertProduct", p);
	}

	//상품상세조회(admin)
	public Product selectProduct(SqlSessionTemplate sqlSession, int productNo) {

		return sqlSession.selectOne("productMapper.selectProduct", productNo);
	}

	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {

		return sqlSession.update("productMapper.deleteProduct", productNo);
	}


	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {

		return sqlSession.update("productMapper.updateProduct", p);
	}

	//상품상세조회(꽃다발/꽃대)
	public Product selectListProduct(SqlSessionTemplate sqlSession, int productNo) {

		return sqlSession.selectOne("productMapper.selectListProduct", productNo);
	}

	//상품마켓전체조회(꽃다발)
	public ArrayList<Product> selectflowerList(SqlSessionTemplate sqlSession){

		return (ArrayList)sqlSession.selectList("productMapper.selectflowerList");
	}
	
	//상품조회(조합형)
	public ArrayList<Product> selectDetailList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("productMapper.selectDetailList");
	}

	//상품마켓전체조회(꽃병)
	public ArrayList<Product> selectListBase(SqlSessionTemplate sqlSession){

		return (ArrayList)sqlSession.selectList("productMapper.selectListBase");
	}


	public int selectSearchCount(SqlSessionTemplate sqlSession, String keyword) {

		return sqlSession.selectOne("productMapper.selectSearchCount", keyword);
	}


	public ArrayList<Product> selectSearchList(SqlSessionTemplate sqlSession, String keyword) {

		return (ArrayList)sqlSession.selectList("productMapper.selectSearchList", keyword);
	}
	
	// 이달의 꽃
	public Product selectTagProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.selectOne("productMapper.selectTagProduct", p);
	}
	
	
}
