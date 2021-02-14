package com.spring.imfind.el.Money;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.YH.MoneyMapper;

@Service("moneyService")
public class MoenyServiceImpl implements MoneyService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PayDTO> getMoneyList(String id) {
		MoneyMapper mapper = sqlSession.getMapper(MoneyMapper.class);
		List<PayDTO> dto = mapper.getMoneyList(id);
		return dto;
	}

	@Override
	public List<PayDTO> getAdjustmentList() {
		MoneyMapper mapper = sqlSession.getMapper(MoneyMapper.class);
		List<PayDTO> dto = mapper.getAdjustmentList();
		return dto;
	}

	@Override
	public int giveMoney(PayDTO vo) {
		MoneyMapper mapper = sqlSession.getMapper(MoneyMapper.class);
		int res = mapper.giveMoney(vo);
		return res;
	}

	@Override
	public int giveMoneyPet(PayDTO vo) {
		MoneyMapper mapper = sqlSession.getMapper(MoneyMapper.class);
		int res = mapper.giveMoneyPet(vo);
		return res;
	}

	@Override
	public List<PayDTO> getAdjustmentList2() {
		MoneyMapper mapper = sqlSession.getMapper(MoneyMapper.class);
		List<PayDTO> dto = mapper.getAdjustmentList2();
		return dto;
	}

}
