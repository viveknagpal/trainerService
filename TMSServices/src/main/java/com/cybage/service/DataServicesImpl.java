package com.cybage.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import com.cybage.dao.DataDao;
import com.cybage.model.Trainer;


public class DataServicesImpl implements DataServices {

	@Autowired
	DataDao dataDao;	
	
	public boolean addEntity(Trainer employee) throws Exception {
		return dataDao.addEntity(employee);
	}
	
	public Trainer getEntityById(long id) throws Exception {
		return dataDao.getEntityById(id);
	}
	
	public List<Trainer> getEntityList() throws Exception {
		return dataDao.getEntityList();
	}

	public boolean deleteEntity(long id) throws Exception {
		return dataDao.deleteEntity(id);
	}

}
