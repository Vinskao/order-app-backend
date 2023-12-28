package com.team.order.functionorder.repository;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.team.order.functionorder.domain.Meal;

@SpringBootTest
public class MealSpringDataJpaDAOImplTests {
    @Autowired
    private MealRepository mealRepository;
    @Test
    public void testSelect(){
        Optional<Meal> selectMeal = mealRepository.findById(4);
            if(selectMeal != null){
                System.err.println(selectMeal.get().toString());
            } else {
                System.err.println("null");
            }
    }
}
