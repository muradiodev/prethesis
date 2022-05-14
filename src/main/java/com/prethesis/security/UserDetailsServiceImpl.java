package com.prethesis.security;

import com.prethesis.entity.User;
import com.prethesis.repo.RepoUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import javax.transaction.Transactional;

class UserDetailsServiceImpl implements UserDetailsService {

    private static final Logger log = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    private RepoUser repoUser;

    @Transactional()
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = repoUser.findByEmail(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found.");
        }

        log.info(username);

        return new PdfUserDetails(user);
    }
}
