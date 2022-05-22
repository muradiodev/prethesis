package com.prethesis.repo;

import com.prethesis.entity.Categories;
import com.prethesis.entity.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RepoCategory extends JpaRepository<Categories, String>  {
}


