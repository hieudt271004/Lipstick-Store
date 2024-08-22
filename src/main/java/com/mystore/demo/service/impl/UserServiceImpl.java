package com.mystore.demo.service.impl;

import com.mystore.demo.entity.AuthUser;
import com.mystore.demo.entity.Role;
import com.mystore.demo.entity.User;
import com.mystore.demo.repository.UserRepository;
import com.mystore.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserDetailsService, UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException(username);
        }

        Set<Role> roles  = user.getRoles();
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();

        if (roles != null) {
            for (Role role : roles) {
                GrantedAuthority authority = new SimpleGrantedAuthority(role.getRoleName());
                grantedAuthorities.add(authority);
            }
        }

        return new AuthUser(
                user.getUsername(),
                user.getPassword(),
                grantedAuthorities,
                user.getId(),
                user.getCreateAt(),
                user.isDeleted(),
                user.getStatus()
        );
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
