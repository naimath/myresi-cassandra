package com.zuabmulabs.myresi.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import com.zuabmulabs.myresi.model.User;
import com.zuabmulabs.myresi.service.UserService;

@Component("customAuthenticationProvider")
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	private UserService userService;
	@Autowired
	HttpServletRequest request;
 
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = authentication.getCredentials().toString();
 
        // use the credentials to try to authenticate against the third party system
     // if (authenticatedAgainstThirdPartySystem()) {
        String result = userLogin(username, password);
        if(result.contains("redirect") ) {
           List<GrantedAuthority> grantedAuths = new ArrayList<GrantedAuthority>();
            grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
            Authentication auth = new UsernamePasswordAuthenticationToken(username, password, grantedAuths);
            return auth;

        } else {
            return null;
        }
     
    }
  
	public String userLogin(@RequestParam String username,	@RequestParam String password) {
	
		User user = new User();
		user.setPassword(password);
		user.setEmail(username);
		user = userService.verifyUser(user);
		if (user != null) {
			request.getSession().setAttribute("email", username);
			if (user.getProfileadded() != null	&& "Y".equals(user.getProfileadded())) {
				return "{\"redirect\":\"/SpringCassandra/users/profile\"}";
			} else {
				request.getSession().setAttribute("profile", "Y");
				return "{\"redirect\":\"/SpringCassandra/users/firstlogin\"}";
			}
		} else {
			return "{\"failed\":\" Login failed either wrong password or not active\"}";
		}
	}
 
    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
