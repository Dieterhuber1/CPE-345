import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Classifier;

network my_Gas_Station2
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
        Queue: PassiveQueue {
            @display("p=640,225");
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
        Source1.out --> Queue.in++;
        Source2.out --> Queue.in++;
        Source3.out --> Queue.in++;
        Source4.out --> Queue.in++;

        Queue.out++ --> pump1.in++;
        Queue.out++ --> pump2.in++;
        Queue.out++ --> pump3.in++;
        Queue.out++ --> pump4.in++;

        pump1.out --> sink.in++;
        pump2.out --> sink.in++;
        pump3.out --> sink.in++;
        pump4.out --> sink.in++;
}
