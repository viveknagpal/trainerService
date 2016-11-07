package com.cybage.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

@Entity
@Table(name = "trainer")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Trainer implements Serializable {

	private static final long serialVersionUID = 1L;
	
	long id;
	String name;
	int age;
	
	@Id
	@GeneratedValue
	@Column(name = "trainer_id")
	@JsonProperty("id")
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	@Column(name = "trainer_name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "trainer_age")
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "Trainer [id=" + id + ", name=" + name + ", age=" + age + "]";
	}

}
