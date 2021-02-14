package com.spring.imfind.el.YH;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface AlarmService {
	public void insertAlarm(AlarmDTO dto);

	public List<AlarmDTO> getAlarm(String id);
}
