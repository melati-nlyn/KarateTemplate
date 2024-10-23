package example.tests;

import com.intuit.karate.junit5.Karate;

public class RunnerRecipes {
    @Karate.Test
    public Karate runRecipes()
    {
        return Karate.run("recipes").relativeTo(getClass());
    }

}