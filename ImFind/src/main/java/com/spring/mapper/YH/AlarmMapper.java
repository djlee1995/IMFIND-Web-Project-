package com.spring.mapper.YH;

import java.util.List;

import com.spring.imfind.el.YH.AlarmDTO;

public interface AlarmMapper {
	void insertAlarm(AlarmDTO dto);
	List<AlarmDTO> getAlarm(String id);
}
