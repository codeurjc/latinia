import com.thoughtworks.gauge.Step;
import net.sf.sahi.client.Browser;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class ComprobarComponentes {
    private Browser browser;


    public ComprobarComponentes() {
        //Invocamos la conexion
        this.browser = EstablecerHost.getBrowser();
    }

    /**
     * Metodo que permite comprar si en la patalla incial existen los componentes habituales
     *
     */

    @Step("comprobar titulo")
    public void Comprobar() {

        //String texto = "SpringBoot Web App deploys on Tomcat";
        String texto = "Global wiki. Wargaming.net";

        // Se realiza la consulta si el titulo es LATINIA si lo es informa que existe el titulo,
        // en caso de que no, sea informa de un ERROR
        if (browser.title().equals(texto)) {
            System.out.println("INF: **Existe el titulo " + texto + " en la plataforma**");
        }else{
            System.out.println("ERR: **No Existe el titulo " + texto + " en la plataforma**");
        }
    }
}
