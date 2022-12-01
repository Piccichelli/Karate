package aula_inatel.projeto2;

import com.intuit.karate.junit5.Karate;

class GorestRunner {
    
    @Karate.Test
    Karate testGorest() {
        return Karate.run("gorest").relativeTo(getClass());
    }    
}
