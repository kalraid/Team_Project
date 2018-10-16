package com.medicine_inc.bbs.kyungmin;

import java.util.List;

import com.medicine_inc.bbs.domain.Jiap;

public interface JiapDao {
 public abstract List<Jiap> jiapList(int startRow, int num);
 public abstract int getJiapCount();
}
