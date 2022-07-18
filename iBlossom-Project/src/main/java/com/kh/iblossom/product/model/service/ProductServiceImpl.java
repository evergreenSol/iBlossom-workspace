package com.kh.iblossom.product.model.service;

import java.util.ArrayList;

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

	@Override
	public int selectSearchCount(String keyword) {
	
	  return productDao.selectSearchCount(sqlSession,keyword);
	}

	@Override
	public ArrayList<Product> selectSearchList(String keyword) {

	  return productDao.selectSearchList(sqlSession, keyword);
	}

@Override
public ArrayList<Product> selectTagProduct(Product p) {
	return productDao.selectTagProduct(sqlSession, p);
}


}