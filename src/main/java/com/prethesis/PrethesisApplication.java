package com.prethesis;

import com.prethesis.controller.ControllerTicket;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import java.security.SecureRandom;

//@ComponentScan(basePackageClasses = ControllerTicket.class)
//@EnableJpaRepositories(basePackages = "com.prethesis.repo")
@EnableJpaAuditing
@SpringBootApplication
public class PrethesisApplication {


    public static void main(String[] args) {
        SpringApplication.run(PrethesisApplication.class, args);
//        generateToken();


    }

    protected static SecureRandom random = new SecureRandom();

    public static String generateToken() {

        long longToken = Math.abs(random.nextLong());
        String random = Long.toString(longToken, 16);
        System.out.println("asdfg:" + random);
        return ("asdfg:" + random);
    }

}
