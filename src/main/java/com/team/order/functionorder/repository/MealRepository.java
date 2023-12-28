package com.team.order.functionorder.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team.order.functionorder.domain.Meal;

public interface MealRepository extends JpaRepository<Meal,Integer>, MealSpringDataJpaDAO{
} 