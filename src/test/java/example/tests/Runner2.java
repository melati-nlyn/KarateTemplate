package example.tests;

import com.intuit.karate.junit5.Karate;

public class Runner2 {
    @Karate.Test
    public Karate runConnectUser () {
        return Karate.run("ConnectUser").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runmealPlanner (){
        return Karate.run("mealPlanRequest").relativeTo(getClass());
    }
}

