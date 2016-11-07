package com.cybage.dao;

import java.util.List;
import com.cybage.model.Trainer;

public interface DataDao {

	public boolean addEntity(Trainer trainer) throws Exception;
	public Trainer getEntityById(long id) throws Exception;
	public List<Trainer> getEntityList() throws Exception;
	public boolean deleteEntity(long id) throws Exception;
}
