//package inet.tutorials.ospf;
package sedulous.simulations;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import inet.common.scenario.ScenarioManager;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.Eth10M;
import ned.DatarateChannel;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;


network SedulousOSPF
{
    @display("bgb=2773.3313,1624.5675");

    types:
        channel PppLink100M extends DatarateChannel
        {
            delay = 5us;
            datarate = 100Mbps;
        }

        channel PppLink10M extends DatarateChannel
        {
            delay = 5us;
            datarate = 10Mbps;
        }

    submodules:
        configurator: Ipv4NetworkConfigurator {
            @display("p=757.8,76.30625");
        }
        visualizer: IntegratedCanvasVisualizer {
            @display("p=1023.5563,76.30625");
        }
        scenarioManager: ScenarioManager {
            @display("p=1310.3625,76.30625");
        }
        host0: StandardHost {
            @display("p=244.47375,1104.075");
        }
        host1: StandardHost {
            @display("p=417.97125,1303.86");
        }
        host2: StandardHost {
            @display("p=625.6425,1335.405");
        }
        host3: StandardHost {
            @display("p=2268.6113,825.4275");
        }
        R1: Router {
            @display("p=788.625,878.0025");
        }
        R2: Router {
            @display("p=1309.1174,878.0025");
        }
        host4: StandardHost {
            @display("p=1882.1849,1232.8838");
        }
        host5: StandardHost {
            @display("p=2060.94,1104.075");
        }
        switch0: EtherSwitch {
            @display("p=591.46875,998.925");
        }
        switch1: EtherSwitch {
            @display("p=1779.6637,875.3737");
        }
        R4: Router {
            @display("p=1306.4888,520.4925");
        }
        R5: Router {
            @display("p=788.625,520.4925");
        }

        host6: StandardHost {
            @display("p=244.47375,391.68375");
        }
        host7: StandardHost {
            @display("p=210.3,552.0375");
        }
        host8: StandardHost {
            @display("p=281.27625,722.90625");
        }
        switch2: EtherSwitch {
            @display("p=1721.8312,496.83374");
        }
        switch3: EtherSwitch {
            @display("p=504.72,517.8638");
        }
        host9: StandardHost {
            @display("p=2192.3774,160.35374");
        }
        host10: StandardHost {
            @display("p=2163.4612,357.51");
        }
        host11: StandardHost {
            @display("p=2218.665,583.5825");
        }
    connections:
        host2.ethg++ <--> Eth100M <--> switch0.ethg++;
        host1.ethg++ <--> Eth100M <--> switch0.ethg++;
        host0.ethg++ <--> Eth100M <--> switch0.ethg++;
        switch0.ethg++ <--> Eth100M <--> R1.ethg++;

        switch1.ethg++ <--> Eth100M <--> host3.ethg++;
        switch1.ethg++ <--> Eth100M <--> host4.ethg++;
        switch1.ethg++ <--> Eth100M <--> host5.ethg++;
        R1.pppg++ <--> PppLink10M <--> R2.pppg++;
        R2.ethg++ <--> Eth10M <--> switch1.ethg++;
        R1.pppg++ <--> PppLink100M <--> R5.pppg++;
        R5.pppg++ <--> PppLink100M <--> R4.pppg++;
        R2.pppg++ <--> PppLink100M <--> R4.pppg++;
        R4.ethg++ <--> Eth10M <--> switch2.ethg++;
        R5.ethg++ <--> Eth10M <--> switch3.ethg++;
        switch2.ethg++ <--> Eth100M <--> host9.ethg++;
        switch2.ethg++ <--> Eth100M <--> host10.ethg++;
        switch2.ethg++ <--> Eth100M <--> host11.ethg++;
        switch3.ethg++ <--> Eth100M <--> host6.ethg++;
        switch3.ethg++ <--> Eth100M <--> host7.ethg++;
        switch3.ethg++ <--> Eth100M <--> host8.ethg++;
}

