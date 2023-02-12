package org.quarkus.samples.petclinic;

import io.quarkus.runtime.Quarkus;
import io.quarkus.runtime.QuarkusApplication;
import io.quarkus.runtime.annotations.QuarkusMain;
import org.apache.commons.lang3.SystemUtils;
import org.jboss.logging.Logger;

@QuarkusMain
public class Main {

  public static void main(String... args) {
    Quarkus.run(BenchmarkApp.class, args);
  }

  public static class BenchmarkApp implements QuarkusApplication {

    private static final Logger LOG = Logger.getLogger(BenchmarkApp.class);

    @Override
    public int run(String... args) throws Exception {
      LOG.info("");
      LOG.info(
          "JVM: "
              + SystemUtils.JAVA_VM_VENDOR
              + " "
              + SystemUtils.JAVA_VM_NAME
              + " "
              + SystemUtils.JAVA_VM_VERSION);
      LOG.info("");

      var pid = ProcessHandle.current().pid();
      LOG.info("My process ID: " + pid);
      LOG.info("");
      Quarkus.waitForExit();
      return 0;
    }
  }
}