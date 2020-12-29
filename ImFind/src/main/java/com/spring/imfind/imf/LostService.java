package com.spring.imfind.imf;

import java.util.HashMap;
import java.util.List;

public interface LostService {
	
	public List<LostVO>place();

	public List<LostVO> lostlist(String placeid);
}
