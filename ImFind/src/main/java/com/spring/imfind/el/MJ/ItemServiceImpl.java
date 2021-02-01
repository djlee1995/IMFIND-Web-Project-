
package com.spring.imfind.el.MJ;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.imfind.el.EJ.PetVO;
import com.spring.mapper.MJ.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService{


   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public List<ItemVO> getItemservice(ItemVO vo) {
      
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<ItemVO> List = mapper.getitem(vo);
      
      
      return List;
   }
   @Override
   public List<ItemVO> getItemservice(String lost_Title){
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<ItemVO> List = mapper.getItemservice(lost_Title);
      
      
      return List;
      
   }
   
   @Override
   public List<ItemVO> getSido(String lost_Loc){
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<ItemVO> List = mapper.getSido(lost_Loc);
      
      
      return List;
      
   }
   @Override
   public List<ItemVO> getdata_info(int lost_PostNum) {
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<ItemVO> List = mapper.getdata_info(lost_PostNum);
      return List;
   }
   
   // YH
   @Override
   public List<IndexLostPostDTO> getItembyDate() {
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<IndexLostPostDTO> List = mapper.getItembyDate();
      return List;
   }
   @Override
   public int update_data(ItemVO vo) {
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      int res  = mapper.update_data(vo);
   
      return res;
   }
   @Override
   public int delete_data(int lost_PostNum) {
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      int res  = mapper.delete_data(lost_PostNum);
      return res;
   }
   // PET
   @Override
   public int petdelete_data(int Pet_PostNum) {
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      int res  = mapper.petdelete_data(Pet_PostNum);
      return res;
   }
   @Override
   public List<PetVO> getPetservice(PetVO vo) {
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<PetVO> List = mapper.getPet(vo);
      return List;
   }
   @Override
   public List<PetVO> getPetservice(String Pet_Title){
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<PetVO> List = mapper.getPetservice(Pet_Title);
      return List;
   }
   @Override
   public List<PetVO> getPetSido(String Pet_Loc){
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<PetVO> List = mapper.getPetSido(Pet_Loc);
      return List;
   }
   @Override
   public List<PetVO> getpetdata_info(int Pet_PostNum) {
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      List<PetVO> List = mapper.getpetdata_info(Pet_PostNum);
      return List;
   }
   @Override
   public int petupdate_data(PetVO vo) {
      ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
      int res  = mapper.petupdate_data(vo);
      return res;
   }

}

 