import com.thoughtworks.gauge.AfterSuite;
import com.thoughtworks.gauge.BeforeSuite;
import com.thoughtworks.gauge.Step;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import net.sf.sahi.Proxy;
import net.sf.sahi.client.Browser;
import net.sf.sahi.config.Configuration;


public class EstablecerHost {
    private Properties propiedades;
    public static final String LOCAL_HOST = "localhost";
    private static final String DEFAULT_BROWSER = "firefox";
    private static final int DEFAULT_PORT = 9999;
    private static Browser browser;
    private static Proxy proxy;
    static final String NAVEGADOR = "DEFAULT_BROWSER";



    public EstablecerHost(){

        propiedades = new Properties();
    }

    @Step("Establecer host <host> port <port> dir <dir>")
    /**
     * Establece el HOST y el PORT que se utilizara en el escenario
     */
    public void establecerHostPort(String host, String port, String dir) throws Exception {
        String hostport="";
        dir = "sample1";
        if ((host.equals("")) && (port.equals(""))) {

            /**
             * HOST y PORT pueden venir por parametro o bien utilizar esta lista de VMs. Es opcional escoger uno u otro modo.
             * Se priorizara el HOST y PORT pasado por parametro
             */
            FileInputStream in = null;
            try {
                in = readPropertiesLogIN();
                propiedades.load(in);

                hostport = propiedades.getProperty("hostport");
                System.out.println("EL HOSTPORT ES: " + hostport);
                

                if (hostport.equals("")) {
                    System.out.println("ERR: No se ha especificado 'host:port'.");
                    throw new Exception("ERR: No se ha especificado 'host:port'.");
                }

                //Separo HOST y PORT para usarlos por separado
                host = hostport.split(":")[0];
                port = hostport.split(":")[1];


                    System.out.println("Iniciando la sesion en " + host + ":" + port + " con Navegador '" + NAVEGADOR);
                    if (dir.contains("sample1")) {
                        browser.navigateTo("http://" + host + ":" + port + "/" + dir);
                    } else {
                        browser.navigateTo("http://" + host + ":" + port + "/");
                    }


            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * permite la ejecucion de sahi
     */

    @BeforeSuite
    public void setup() {

        String sahiInstallDir = System.getenv("sahi.install_dir");
        if (sahiInstallDir == null || sahiInstallDir.isEmpty()) {
            throw new RuntimeException("Sahi Install directory not specified. Set in env/default/sahi_config.properties file");
        }
        Configuration.init(sahiInstallDir, userDataDir());
        launchBrowser();
    }

    /**
     * Detiene el proxy, es decir para la ejecucion de sahi, una vez ejecutadas las acciones.
     * @throws InterruptedException
     */
    @AfterSuite
    public void tearDown() throws InterruptedException {
        if (browser != null) {
            browser.close();
            System.out.print("Cerrada sesion del browser");
        }
        if (proxy != null && proxy.isRunning()) {
            proxy.stop();
            System.out.println("Detenido el PROXY");
        }
    }

    /**
     * Metodo que permite ir al archivo logIN.properties y coger el host el cual queremos acceder
     * @return
     */

    public static FileInputStream readPropertiesLogIN() {
        FileInputStream in;
        try {
            in = new FileInputStream("logIN.properties");
            return in;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }



    private String userDataDir() {
        return new File("sahi", "userdata").getAbsolutePath();
    }

    private String browserName() {
        String browserName = System.getenv("sahi.browser_name");
        if (!(browserName == null || browserName.isEmpty())) {
            return browserName;
        }
        return DEFAULT_BROWSER;
    }

    public static Browser getBrowser() {

        return browser;
    }

    private void launchBrowser() {
        int port = portNumber();
        startProxy(port);
        browser = new Browser(browserName(), LOCAL_HOST, port);
        browser.open();
    }

    private int portNumber() {
        return DEFAULT_PORT;
    }

    private void startProxy(int port) {
        proxy = new Proxy(port);
        proxy.start(true);
        waitForProxy(10000);
    }

    private void waitForProxy(int waitUntil) {
        int counter = 0;
        while (!proxy.isRunning() && counter < waitUntil) {
            try {
                Thread.sleep(1000);
                counter += 1000;
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        if (!proxy.isRunning()) {
            throw new RuntimeException("Sahi Proxy server is not starting");
        }
    }


}
