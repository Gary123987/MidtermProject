package com.skilldistillery.jpaeventlight.data;

import com.skilldistillery.jpaeventlight.entities.User;

public interface UserDAO {
	
	User findByUsernameAndPassword(String username, String password);

	
	
	

}
