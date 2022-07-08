package com.kh.iblossom.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.vo.Product;

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

	//상품상세조회
	public Product selectProduct(SqlSessionTemplate sqlSession, int productNo) {

		return sqlSession.selectOne("productMapper.selectProduct", productNo);
	}
	
	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {

		return sqlSession.update("productMapper.deleteProduct", productNo);
	}

	
	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {

		System.out.println(p);
		return sqlSession.update("productMapper.updateProduct", p);
	}


}
