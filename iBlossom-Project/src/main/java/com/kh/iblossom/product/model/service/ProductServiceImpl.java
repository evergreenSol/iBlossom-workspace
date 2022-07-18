package com.kh.iblossom.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.iblossom.common.model.vo.PageInfo;
import com.kh.iblossom.product.model.dao.ProductDao;
import com.kh.iblossom.product.model.vo.Product;
import com.kh.iblossom.subscribe.model.vo.Subscribe;

@Service
public class ProductServiceImpl implements ProductService{

   @Autowired
   private ProductDao productDao;
   
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public int selectListCount() {
      
      return productDao.selectListCount(sqlSession);
   }
   
   @Override
   public int insertProduct(Product p) {
      
      return productDao.insertProduct(sqlSession,p);
   }
   
   @Override
   public ArrayList<Product> selectList(PageInfo pi) {

      return productDao.selectList(sqlSession, pi);
   }

   @Override
   public Product selectProduct(int productNo) {
      return productDao.selectProduct(sqlSession, productNo);
   }
   
   @Override
   public Product selectListProduct(int productNo) {
      return productDao.selectListProduct(sqlSession, productNo);
   }

   @Override
   public int deleteProduct(int productNo) {

      return productDao.deleteProduct(sqlSession, productNo);
   }

   @Override
   public int updateProduct(Product p) {
      return productDao.updateProduct(sqlSession, p);
   }

   @Override
   public ArrayList<Product> selectflowerList() {
      return productDao.selectflowerList(sqlSession);
   }

   @Override
   public ArrayList<Product> selectListBase() {
      return productDao.selectListBase(sqlSession);
   }
   
   @Override
   public ArrayList<Product> selectDetailList() {
      return productDao.selectDetailList(sqlSession);
   }
   
	// 검색용 메소드
	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		 
		return productDao.selectSearchCount(sqlSession, map);
	}
	
	//상품 검색용 메소드
	@Override
	public ArrayList<Product> selectSearchList(PageInfo pi, HashMap<String, String> map) {

		return productDao.selectSearchList(sqlSession, pi, map);
	}

}