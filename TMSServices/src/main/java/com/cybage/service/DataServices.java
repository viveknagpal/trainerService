package com.cybage.service;

import java.util.List;
import com.cybage.model.Trainer;

public interface DataServices {
	public boolean addEntity(Trainer trainer) throws Exception;
	public Trainer getEntityById(long id) throws Exception;
	public List<Trainer> getEntityList() throws Exception;
	public boolean deleteEntity(long id) throws Exception;
}
