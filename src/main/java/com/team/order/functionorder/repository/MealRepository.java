package com.team.order.functionorder.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team.order.functionorder.domain.meal;

public interface MealRepository extends JpaRepository<meal,Integer>, MealSpringDataJpaDAO{
} 