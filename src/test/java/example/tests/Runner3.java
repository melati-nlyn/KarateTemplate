package example.tests;

import com.intuit.karate.junit5.Karate;

public class Runner3 {
    @Karate.Test
    public Karate runingredientInformation(){
        return Karate.run("ingredientInformation").relativeTo(getClass());
    }
}
