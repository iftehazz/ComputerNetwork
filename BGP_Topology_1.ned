//package inet.tutorials.bgp;
package sedulous.simulations;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.visualizer.integrated.IntegratedMultiCanvasVisualizer;


network Sedulous
{
    @display("bgb=1732.0874,1092.2925");

    submodules:
        configurator: Ipv4NetworkConfigurator {
            @display("p=93,44");
        }
        visualizer: IntegratedMultiCanvasVisualizer {
            @display("p=243.2025,43.536247");
        }
        RB2: Router {
            @display("p=914.93994,349.73248");
        }
        RB3: Router {
            @display("p=1195.0575,591.7275");
        }
        RB4: Router {
            @display("p=1195.0575,349.73248");
        }
        RB1: Router {
            @display("p=903.33746,591.7275");
        }
        RA4: Router {
            @display("p=629.85,591.7275");
        }
        RA2: Router {
            @display("p=644.76746,372.9375");
        }
        RA3: Router {
            @display("p=414.37497,591.7275");
        }

        RA1: Router {
            @display("p=412.7175,374.59497");
        }
        switch1: EtherSwitch {
            @display("p=241.995,372.9375");
        }
        switch3: EtherSwitch {
            @display("p=263.54248,590.07");
        }
        switch5: EtherSwitch {
            @display("p=1410.5325,590.07");
        }
        switch6: EtherSwitch {
            @display("p=1369.095,348.07498");
        }
        host0: StandardHost {
            @display("p=71.2725,372.9375");
        }
        host1: StandardHost {
            @display("p=1594.5149,349.73248");
        }
        host2: StandardHost {
            @display("p=1621.0349,591.7275");
        }
        host3: StandardHost {
            @display("p=71.2725,619.90497");
        }
    connections:
        RB2.ethg++ <--> Eth100M <--> RB4.ethg++;
        RB3.ethg++ <--> Eth100M <--> RB4.ethg++;
        RB1.ethg++ <--> Eth100M <--> RB2.ethg++;
        RB1.ethg++ <--> Eth100M <--> RB3.ethg++;
        RB1.ethg++ <--> Eth100M <--> RA4.ethg++;
        RA4.ethg++ <--> Eth100M <--> RA2.ethg++;
        RA3.ethg++ <--> Eth100M <--> RA4.ethg++;
        RA2.ethg++ <--> Eth100M <--> RA1.ethg++;
        RA1.ethg++ <--> Eth100M <--> RA3.ethg++;
        switch1.ethg++ <--> Eth100M <--> RA1.ethg++;
        RA3.ethg++ <--> Eth100M <--> switch3.ethg++;
        RB3.ethg++ <--> Eth100M <--> switch5.ethg++;
        switch1.ethg++ <--> Eth100M <--> host0.ethg++;
        switch6.ethg++ <--> Eth100M <--> host1.ethg++;
        RB4.ethg++ <--> Eth100M <--> switch6.ethg++;
        switch5.ethg++ <--> Eth100M <--> host2.ethg++;
        switch3.ethg++ <--> Eth100M <--> host3.ethg++;
}

