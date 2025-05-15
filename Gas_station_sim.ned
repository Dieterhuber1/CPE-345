import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Classifier;



network my_Gas_Station
{
    @display("bgb=940,542");
    submodules:
        Source1: Source {
            parameters:
                interArrivalTime = exponential(30s);
                @display("p=844,60");
        }
        Source2: Source {
            interArrivalTime = exponential(30s);
            @display("p=844,166");
        }
        Source3: Source {
            interArrivalTime = exponential(30s);
            @display("p=844,273");
        }
        Source4: Source {
            interArrivalTime = exponential(30s);
            @display("p=844,391");
        }
        Queue1: PassiveQueue {
            @display("p=693,61");
        }
        Queue2: PassiveQueue {
            @display("p=693,167");
        }
        Queue3: PassiveQueue {
            @display("p=693,273");
        }
        Queue4: PassiveQueue {
            @display("p=693,391");
        }
        pump1: Server {
            parameters:
                serviceTime = default(exponential(60s));
                @display("p=411,61");

        }
        pump2: Server {
            parameters:
                serviceTime = default(exponential(60s));
                @display("p=411,167");
        }
        pump3: Server {
            parameters:
                serviceTime = default(exponential(60s));
                @display("p=411,273");
        }
        pump4: Server {
            parameters:
                serviceTime = default(exponential(60s));
                @display("p=411,391");
        }
        sink: Sink {

            @display("p=133,226");
        }
    connections allowunconnected:
        Source1.out --> Queue1.in++;
        Source2.out --> Queue2.in++;
        Source3.out --> Queue3.in++;
        Source4.out --> Queue4.in++;

        Queue1.out++ --> pump1.in++;
        Queue2.out++ --> pump2.in++;
        Queue3.out++ --> pump3.in++;
        Queue4.out++ --> pump4.in++;

        pump1.out --> sink.in++;
        pump2.out --> sink.in++;
        pump3.out --> sink.in++;
        pump4.out --> sink.in++;
}
