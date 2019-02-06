# Ejemplo de uso Gauge

## Previos

Clonar el repositorio:

`git clone https://github.com/codeurjc/latinia && cd ~/latinia/gauge-test`

## Construir el contenedor

Para construir el contenedor con las herramientas necesarias accedemos al directorio Docker y escribimos:

`$ docker build -t codeurjc-gauge-ejemplo .`

## Descripción del proyecto

Los fichero que tienes que editar para probar Gauge son los siguientes:

**1. logIN.properties**

Definir la variable host:port con la IP y el puerto del servicio. En nuestro ejemplo la hemos fijado a

`hostport = wiki.wargaming.net:80`

**2. ComprobarComponentes.java**

En la ruta `src/test/java`

Comprobará que la cadena texto coincide con el título de la página web. En nuestro ejemplo establecemos que la página web debe llevar por título:

_Global wiki. Wargaming.net_

**3. EstablecerHost.java** 

En la ruta `src/test/java`

Configura el entorno de ejecución. La URL a atacar. Levantar el browser.

**4. sahi_config.properties**

Definir dónde están las librerías de Sahi. En nuestro contenedor Docker de Gauge  las librerías de Sahi se encuentran en /sahi. No se debería tocar este fichero para lanzar la prueba.

## Lanzar el ejemplo

Para lanzar el ejemplo simplemente escribimos:

`$ docker run -ti --rm --name gauge -v ${PWD}:/workdir -w /workdir codeurjc-gauge-ejemplo /workdir/run_test.sh`

Lo que hace este comando es:

`-ti` Para que muestre la salida de la ejecución en consola.
`--rm` Se elimina el contenedor tras la ejecución.
`--name gauge` Lo hemos llamado gauge.
`-v ${PWD}:/workdir` Mapeamos nuestro directorio local dentro del contenedor para poder ejecutar el script usando rutas conocidas.
`-w /workdir` Este será nuestro directorio de trabajo dentro del contenedor.
`codeurjc-gauge-ejemplo` El nombre de la imagen.
`/workdir/run_test.sh` La ruta completa al script que vamos a lanzar.

Una vez lanzado deberemos ver algo así:

```
Sahi properties file = /sahi/config/sahi.properties
Sahi user properties file = /workdir/sahi/userdata/config/userdata.properties
>>>> Sahi OS v5.0 started. Listening on port: 9999
>>>> Configure your browser to use this server and port as its proxy
>>>> Browse any page and CTRL-ALT-DblClick on the page to bring up the Sahi Controller
-----
Reading browser types from: /workdir/sahi/userdata/config/browser_types.xml
-----
Feb 06, 2019 9:07:47 AM net.sf.sahi.ssl.SSLHelper getKeyManagerFactoryForRemoteFetch
INFO: No SSL Client Cert specified
Feb 06, 2019 9:07:48 AM net.sf.sahi.test.ProcessHelper execute
INFO: /usr/bin/firefox -profile "/workdir/sahi/userdata/browser/ff/profiles/sahi0" -no-remote http://sahi.example.com/_s_/dyn/Driver_start?sahisid=sahi_3bd58ea80e5ca0415c0b2b00108eb3c6af94__SahiAmpersandSahi__startUrl=http%3A%2F%2Fsahi.example.com%2F_s_%2Fdyn%2FDriver_initialized%3FstartUrl%3Dhttp%253A%252F%252Fsahi.example.com%252F_s_%252Fdyn%252FDriver_initialized
Feb 06, 2019 9:07:49 AM net.sf.sahi.test.ProcessHelper$PIDGatherer run
INFO: PIDs: [86, 167]; 1630 ms
# Specification Heading
  ## Scenario Heading	EL HOSTPORT ES: wiki.wargaming.net:80
Iniciando la sesion en wiki.wargaming.net:80 con Navegador 'DEFAULT_BROWSER
 ✔INF: **Existe el titulo Global wiki. Wargaming.net en la plataforma**
 ✔

Feb 06, 2019 9:07:53 AM net.sf.sahi.test.ProcessHelper kill
INFO: Kill: [86, 167]
Cerrada sesion del browserDetenido el PROXY
Socket closed
Successfully generated html-report to => /workdir/reports/html-report/index.html
Specifications:	1 executed	1 passed	0 failed	0 skipped
Scenarios:	1 executed	1 passed	0 failed	0 skipped

Total time taken: 6.766s

Telemetry
---------

This installation of Gauge collects usage data in order to help us improve your experience.
The data is anonymous and doesn't include command-line arguments.
To turn this message off opt in or out by running 'gauge telemetry on' or 'gauge telemetry off'.

Read more about Gauge telemetry at https://gauge.org/telemetry
```

El contenedor desaparecerá en estos momentos.

## Lanzar el ejemplo de forma visual

Podemos lanzar el test de forma que podamos ver gráficamente qué está ocurriendo. Para ello añadimos el parámetro 

`-p 5900:5900`

Que nos permite conectarnos al servidor VNC que hemos construido dentro de la imagen docker.

Ahora nuestro comando de lanzamiento del contendor quedaría así:

`$ docker run -d --rm --name gauge -v ${PWD}:/workdir -w /workdir -p 5900:5900 codeurjc-gauge-ejemplo`

Hemos lanzado el contenedor en segundo plano y nos conectaremos mediante VNC a la dirección 

`localhost:5900`

> La contraseña es `1234`

Para conectar por VNC puedes usar el cliente VNC de esta URL:

https://www.realvnc.com/en/connect/download/viewer/

Al acceder veremos una interface realmente horrible pero que es ligera y nos sirve a los propositos.

En la consola que aparece, podemos lanzar el test así:

`$ ./run_test.sh`

Y veremos como se levanta un browser y se conecta la Web que hemos establecido y comprueba el título.

## Fichero generados

Cuando se lanza el test se compilan los ficheros Java en el directorio 

`gauge_bin`

En ocasiones conviene eliminar este directorio si se ha cambiado la configuración para prevenir que se siga usando la antigua.