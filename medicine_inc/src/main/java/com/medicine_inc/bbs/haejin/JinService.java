package com.medicine_inc.bbs.haejin;

import java.util.ArrayList;
import java.util.List;

import com.medicine_inc.bbs.domain.Pharmacy;

public interface JinService {

	public abstract List<Pharmacy> radiansList(String lat, String lng);
}
