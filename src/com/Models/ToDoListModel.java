package com.Models;

public class ToDoListModel {
	int task_id;
	String task, user_id;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	
}
