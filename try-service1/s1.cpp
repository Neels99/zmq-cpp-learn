#include <iostream>
#include <chrono>
#include <thread>
#include <boost/asio.hpp>
#include <zmq.hpp>

template <typename F>
boost::asio::steady_timer create_timer(boost::asio::io_context& ctx, std::chrono::seconds sec, F&& func)
{
    boost::asio::steady_timer timer(ctx, sec);
    timer.async_wait(
        [func](const boost::system::error_code& ec)
        {
            func();
        }
    );

    return std::move(timer);
}

void zmq_thread()
{
    zmq::context_t context(1);

    // Сокет для ответов
    zmq::socket_t responder(context, ZMQ_PULL);
    responder.bind("tcp://*:5555");

    // Сокет для запросов
    zmq::socket_t requester(context, ZMQ_PUB);
    requester.connect("tcp://localhost:5556");

    zmq::pollitem_t items[] = {
        { (void*)responder, 0, ZMQ_POLLIN, 0 },
        { (void*)requester, 0, ZMQ_POLLOUT, 0 }
    };

    for (;;)
    {
        zmq::poll(items, 2, -1);

        if (items[0].revents & ZMQ_POLLIN)
        {
            zmq::message_t message;
            responder.recv(&message);
            std::cout << "Received message from socket1: " << std::string(static_cast<char*>(message.data()), message.size()) << std::endl;
        }

        if (items[1].revents & ZMQ_POLLOUT)
        {
            std::string message = "Hello from socket2";
            zmq::message_t zmq_message(message.size());
            memcpy(zmq_message.data(), message.c_str(), message.size());
            requester.send(zmq_message);
            std::cout << "Sent message from socket2: " << message << std::endl;
        }
    }
    
}

int main()
{
    std::thread zmq_th{zmq_thread};

    using namespace std::chrono_literals;
    boost::asio::io_context ctx;

    auto t1 = create_timer(ctx, 1s, []{ std::cout << "1" << std::endl; });
    auto t2 = create_timer(ctx, 3s, []{ std::cout << "2" << std::endl; });

    ctx.run();

    zmq_th.join();
}