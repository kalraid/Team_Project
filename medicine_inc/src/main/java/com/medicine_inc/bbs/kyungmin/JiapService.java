package com.medicine_inc.bbs.kyungmin;

import java.util.List;
import java.util.Map;

import com.medicine_inc.bbs.domain.Jiap;

public interface JiapService {

	public abstract Map<String, Object> jiapList(int pageNum);
}
